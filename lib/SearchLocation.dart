import 'package:flutter/material.dart';

import 'ServicesList.dart';
import 'widgets/AppDrawer.dart';

class SearchLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ESI : Location')),
      body: Center(
        child: RaisedButton(
          child: Text('Search : City / State'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ServicesList()),
            );
          },
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}