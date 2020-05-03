import 'package:flutter/material.dart';

class DisclaimerPage extends StatelessWidget {
  final Widget child;

  DisclaimerPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disclaimer'),
      ),
      body: Padding(
  padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                "Disclaimer".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('We are a community sourced listing platform and are not associated with any of the organisations listed below.'),
              Text('Although we verify all our listings, we request you to follow all the guidelines and take necessary precautions.'),
              Text('We encourage you to report any error or suspicious activity so we can take immediate action.'),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
