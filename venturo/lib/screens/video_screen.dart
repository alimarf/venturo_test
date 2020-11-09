import 'package:flutter/material.dart';
import 'package:venturo/drawer/nav_drawer.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Video Screen'),
      ),
      body: Center(
        child: Text('Video Screen'),
      ),
    );
  }
}
