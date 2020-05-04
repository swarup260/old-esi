import 'package:flutter/material.dart';

import 'SearchLocation.dart';
import 'Walkthrough.dart';
import 'api/networkManager.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getPersistedSeenWalkthrough(),
          initialData: false,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.data) {
              return Walkthrough();
            } else {
              return SearchLocation();
            }
          }),
    );
  }
}
