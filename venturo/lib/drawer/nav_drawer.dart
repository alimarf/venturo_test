import 'package:flutter/material.dart';
import 'package:venturo/drawer/drawer_header.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          NavDrawerHeader(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/');
              // Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.monitor),
            title: Text('Video'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/video');
              // Navigator.pushReplacementNamed(context, '/video');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              // Navigator.pop(context);
              // Navigator.pushNamed(context, '/profile');
              Navigator.pushReplacementNamed(context, '/profile');
            },
          ),
        ],
      ),
    );
  }
}
