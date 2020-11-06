import 'package:flutter/material.dart';
import 'package:vent_app/home.dart';
import 'package:vent_app/video.dart';

void main() {
  runApp(VenturoApp());
}

class VenturoApp extends StatefulWidget {
  @override
  _VenturoAppState createState() => _VenturoAppState();
}

class _VenturoAppState extends State<VenturoApp> {
  int index = 0;
  List<Widget> list = [
    HomePage(),
    VideoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Materi Pembelajaran'),
        ),
        body: list[index],
        drawer: NavDrawer(
          onTap: (ctx, i) {
            setState(() {
              index = i;
              Navigator.pop(ctx);
            });
          },
        ),
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  NavDrawer({this.onTap});

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    // const colour =  colour(0xFF5666A6);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF5666A6)),
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/avatar.png'),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Alim Arief',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => onTap(context, 0),
            ),
            ListTile(
              leading: Icon(Icons.monitor),
              title: Text('Video'),
              onTap: () => onTap(context, 1),
            ),
          ],
        ),
      ),
    );
  }
}
