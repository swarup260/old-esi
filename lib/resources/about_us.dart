import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  final Widget child;

  AboutUsPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Color(0xFFf7fbff),
                backgroundImage: AssetImage('assets/images/logo.png'),
                radius: 80.0,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Essential Services India".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Version 1.0.0'),
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
