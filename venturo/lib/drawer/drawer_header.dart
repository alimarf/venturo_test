import 'package:flutter/material.dart';

class NavDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Row(
        children: <Widget>[
          Container(
            width: 50.0,
            height: 50.0,
            child: CircleAvatar(
              backgroundImage: AssetImage('images/avatar.png'),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: 120.0,
            height: 55.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Software Engineer',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Alimarf',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Color(0xFF5666A6),
      ),
    );
  }
}
