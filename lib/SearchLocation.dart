import 'package:esi_essential_services_india/api/networkManager.dart';
import 'package:esi_essential_services_india/widgets/AppDrawer.dart';
import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';

import 'api/apiEndpoint.dart';
import 'ServicesList.dart';
import 'resources/StateCityList.dart';

class SearchLocation extends StatefulWidget {
  @override
  _SearchLocationState createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  StateCityList repo = StateCityList();

  List<String> _states = ["Choose a state"];
  List<String> _lgas = ["Choose .."];
  String _selectedState = "Choose a state";
  String _selectedLGA = "Choose ..";

  final _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;

  @override
  void initState() {
    _states = List.from(_states)..addAll(repo.getStates());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        elevation: 0.1,
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              child: Column(
                children: <Widget>[
                  Text("ESI",
                      style: TextStyle(
                          fontSize: 75,
                          color: Colors.green,
                          fontWeight: FontWeight.bold)),
                  Text("Essential Services India", style: TextStyle(fontWeight: FontWeight.bold )),
                  SizedBox(height: 20),
                  Image.asset('assets/images/india-flag.png'),
                  SizedBox(height: 10),
                  Form(
                      key: _formKey,
                      autovalidate: _autovalidate,
                      child: Column(
                        children: <Widget>[
                          DropdownButtonFormField<String>(
                            validator: (value) => value == 'Choose a state'
                                ? 'field required'
                                : null,
                            isExpanded: false,
                            items: _states.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem),
                              );
                            }).toList(),
                            onChanged: (value) => _onSelectedState(value),
                            value: _selectedState,
                          ),
                          DropdownButtonFormField<String>(
                            validator: (value) => value == 'Choose ..'
                                ? 'Please select City.'
                                : null,
                            isExpanded: false,
                            items: _lgas.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem),
                              );
                            }).toList(),
                            // onChanged: (value) => print(value),
                            onChanged: (value) => _onSelectedLGA(value),
                            value: _selectedLGA,
                          ),
                          SizedBox(height: 15),
                          Center(
                            child: RaisedButton(
                              color: Colors.green,
                              child: Text('Search'),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  //form is valid, proceed further
                                  _formKey.currentState
                                      .save(); //save once fields are valid, onSaved method invoked for every form fields
                                  bool flag = await setPersistedStateCity({
                                    "state": _selectedState,
                                    "city": _selectedLGA
                                  });
                                  if (flag) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ServicesList()),
                                    );
                                  }
                                } else {
                                  setState(() {
                                    _autovalidate =
                                        true; //enable realtime validation
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: AdmobBanner(
                  adUnitId: getBannerAdUnitId(bannerAdType.LARGE_BANNER),
                  adSize: AdmobBannerSize.LARGE_BANNER,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSelectedState(String value) {
    setState(() {
      _selectedLGA = "Choose ..";
      _lgas = ["Choose .."];
      _selectedState = value;
      _lgas = List.from(_lgas)..addAll(repo.getLocalByState(value));
    });
  }

  void _onSelectedLGA(String value) {
    setState(() => _selectedLGA = value);
  }
}
