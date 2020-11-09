import 'package:flutter/material.dart';
import 'package:venturo/drawer/nav_drawer.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}
