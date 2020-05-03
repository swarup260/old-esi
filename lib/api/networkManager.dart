import 'dart:convert';

import 'package:esi_essential_services_india/models/resources.dart';
/**
 * All Modules 
 */
import 'package:http/http.dart' as http;
import 'package:esi_essential_services_india/api/apiEndpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

Future<SharedPreferences> getPrefs() => _prefs;

/// Getter And Setter To Timestamp ||  Api Resources From SharedPreferences
Future<bool> setPersistedTimestamp(int timestamp) async {
  final SharedPreferences prefs = await _prefs;
  return prefs.setInt('timestamp', timestamp);
}

Future<int> getPersistedTimestamp() async {
  final SharedPreferences prefs = await _prefs;
  return prefs.getInt('timestamp');
}

Future<bool> setPersistedResources(String resources) async {
  final SharedPreferences prefs = await _prefs;
  return prefs.setString('resources', resources);
}

Future<String> getPersistedResources() async {
  final SharedPreferences prefs = await _prefs;
  return prefs.getString('resources') ?? "";
}

Future<bool> setPersistedStateCity(stateCity) async {
  final SharedPreferences prefs = await _prefs;
  return prefs.setString('stateCity', json.encode(stateCity));
}

Future<Map<String, dynamic>> getPersistedStateCity() async {
  final SharedPreferences prefs = await _prefs;
  Map<String, dynamic> stateCity = json.decode(prefs.getString('stateCity') ?? "{}");
  return stateCity;
}

Future<bool> setPersistedSeenWalkthrough(bool flag) async{
  final SharedPreferences prefs = await _prefs;
  return prefs.setBool('seenWalkthrough', flag);
}

Future<bool> getPersistedSeenWalkthrough() async{
  final SharedPreferences prefs = await _prefs;
  return prefs.getBool('seenWalkthrough') ?? false;
}

// the URL of the Web Server
String _urlBase = getBaseurl();

/// @return Future<dynamic>
Future<dynamic> ajaxGet(String serviceName) async {
  try {
    final response = await http.get(Uri.http(_urlBase, serviceName));
    return response;
  } catch (e) {
    throw new Exception("Error While Processing");
  }
}

Future<List<Resource>> getResources() async {
  List<Resource> resources = [];
  String persistedResource = await getPersistedResources();
  try {
   /// interval check if the Interval time period is over or not
    int interval = getInterval();
    DateTime now = new DateTime.now();
    int timestamp = await getPersistedTimestamp() ?? 0;
    if (persistedResource.length == 0 ||
        now.difference(DateTime.fromMillisecondsSinceEpoch(timestamp)).inDays <
            interval) {
      final response = await ajaxGet(getApiEndpoint(endpoint.getResources));
      print(response.statusCode);
      if (response.statusCode == 200) {
        setPersistedResources(response.body);
        setPersistedTimestamp(now.millisecondsSinceEpoch);
      }
    }

    persistedResource = await getPersistedResources();
    resources = resourcesFromJson(persistedResource).resources;

    /* Return Only the select State & City Data */
    Map<String, dynamic> stateCityMap = await getPersistedStateCity();
    // Map <String,String> stateCityMap = {"state" : "Maharashtra" , "city" : "Mumbai"};
    String state = stateCityMap['state'];
    String city = stateCityMap['city'];
    RegExp regExpState = new RegExp(state, caseSensitive: false);
    RegExp regExpCity = new RegExp(city, caseSensitive: false);
    return resources
        .where((Resource f) =>
            regExpCity.hasMatch(f.city) && regExpState.hasMatch(f.state))
        .toList();
  } catch (e) {
    throw new Exception('Error');
  }
}
