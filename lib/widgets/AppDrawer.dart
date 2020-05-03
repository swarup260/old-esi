import 'package:admob_flutter/admob_flutter.dart';
import 'package:esi_essential_services_india/api/apiEndpoint.dart';
import 'package:flutter/material.dart';
import 'package:esi_essential_services_india/resources/about_us.dart';
import 'package:esi_essential_services_india/resources/disclaimer.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                  child: Text(
                'ESI',
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.info_outline),
                  Text(' About Us'),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AboutUsPage()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.security),
                  Text(' Disclaimer'),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DisclaimerPage()),
                );
              },
            )
          ],
        ),
      );
  }
}