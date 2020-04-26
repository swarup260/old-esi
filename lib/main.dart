import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ESI - Essential Services India',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ESI - Essential Services India'),
        ),
        body: Center(
          child: Text('ESI'),
        ),
      ),
    );
  }
}