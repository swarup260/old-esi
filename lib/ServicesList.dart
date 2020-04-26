import 'package:flutter/material.dart';

import 'ServicesDetails.dart';
import 'widgets/AppDrawer.dart';

class ServicesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ESI: Services"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ServicesDetails()),
            );
          },
          child: Text('View : List of Services Card || Select Service : EG : TEST Lab'),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}