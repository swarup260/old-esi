import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'ESI: Essential Services India';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primaryColorDark: Colors.green[600],
        primaryColor: Colors.green,
        primaryColorLight: Colors.green[100],
        primaryIconTheme: IconThemeData(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
        indicatorColor: Colors.black,
        fontFamily: 'Rubik',
      ),
      home: Home(),
      // home: FutureBuilder(
      //   future: isShowWalkThrough(),
      //   initialData: false,
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.data) {
      //       return Home();
      //     } else {
      //       return Walkthrough();
      //     }
      //   },
      // ),
    );
  }
}