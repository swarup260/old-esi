import 'package:esi_essential_services_india/Walkthrough.dart';
import 'package:esi_essential_services_india/api/networkManager.dart';
import 'package:flutter/material.dart';

import 'SearchLocation.dart';


class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getPersistedSeenWalkthrough(),
        builder: (BuildContext context ,AsyncSnapshot<bool> snapshot){
          if (!snapshot.data) {
            return Walkthrough();
          } else {
            return SearchLocation();
          }
      } ),
    );
  }
}
