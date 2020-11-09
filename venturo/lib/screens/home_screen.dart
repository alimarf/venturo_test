import 'package:flutter/material.dart';
import 'package:venturo/Drawer/nav_drawer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:venturo/services/belajar.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<String> getData() async {
    var url = 'http://tes-mobile.landa.id/index.php';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      setState(() {
        data = jsonResponse['data'];
      });
      // data = jsonResponse['data'];
      // var data = jsonResponse['data'];
      print('JSON RESPONSE: $data.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return "success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Materi Pembelajaran'),
      ),
      drawer: NavDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.network(
                'http://tes-mobile.landa.id/top_home.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              Container(
                height: 300,
                padding: EdgeInsets.only(left: 10.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Matematika Bab 1',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: _buildListView(),
          ),
        ],
      ),
    );
  }

  Widget _buildListView() {
    // hKXyjyQhqSU
    // YoutubePlayerController _controller = YoutubePlayerController(
    //   initialVideoId: 'hKXyjyQhqSU',
    //   flags: YoutubePlayerFlags(
    //     autoPlay: true,
    //     mute: true,
    //   ),
    // );

    return ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: _buildImageColumn(data[index]),
            onTap: () {
              setState(() {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        elevation: 10.0,
                        contentPadding: EdgeInsets.all(0),
                        // title: Text("Youtube Video"),
                        content: YoutubePlayer(
                          controller: YoutubePlayerController(
                            initialVideoId: data[index]['detail'][index]
                                ['youtube_id'],
                            flags: YoutubePlayerFlags(
                              autoPlay: true,
                              mute: true,
                            ),
                          ),
                          showVideoProgressIndicator: true,
                        ),
                      );
                    });
              });
            },
          );
        });
  }

  Widget _buildImageColumn(dynamic item) => Container(
        // decoration: BoxDecoration(
        //   color: Colors.blue[50],
        // ),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            _buildRow(item),
            SizedBox(
              height: 10.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                imageUrl: "http://tes-mobile.landa.id/top_home.png",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ],
        ),
      );

  Widget _buildRow(dynamic item) {
    return Card(
      color: Colors.lightBlueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: ListTile(
        title: Text(
          item['nama'] == null ? '' : item['nama'],
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // Widget _buildRow(dynamic item) {
  //   Card(
  //     color: Colors.lightBlueAccent,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(50.0),
  //     ),
  //     child: ListTile(
  //       title: Text(
  //         item['nama'] == null ? '' : item['nama'],
  //         style: TextStyle(color: Colors.white),
  //       ),
  //     ),
  //   );
  // }
}
