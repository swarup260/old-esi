import 'package:esi_essential_services_india/ServicesList.dart';
import 'package:esi_essential_services_india/api/networkManager.dart';
import 'package:flutter/material.dart';

import 'SearchLocation.dart';


class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getPersistedStateCity(),
        builder: (BuildContext context ,AsyncSnapshot<Map<String,dynamic>> snapshot){
          if (snapshot.data.length == 2) {
            return ServicesList();
          } else {
            return SearchLocation();
          }
      } ),
    );
  }
}
