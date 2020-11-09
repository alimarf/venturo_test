import 'package:flutter/material.dart';
import 'package:venturo/screens/home_screen.dart';
import 'package:venturo/screens/video_screen.dart';
import 'package:venturo/screens/profile_screen.dart';

void main() {
  runApp(VenturoApp());
}

class VenturoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/video': (context) => VideoScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
