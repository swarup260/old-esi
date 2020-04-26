import 'package:flutter/material.dart';

import 'SearchLocation.dart';
import 'widgets/AppDrawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

// SingleTickerProviderStateMixin is used for animation
class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('ESI : Home')),
      body: SearchLocation(),
      //drawer: AppDrawer(),
    );
  }
}
