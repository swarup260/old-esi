import 'package:flutter/material.dart';

import 'widgets/AppDrawer.dart';

class ServicesDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ESI: Test Lab"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Test Lab Results Cards: Go back!'),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}