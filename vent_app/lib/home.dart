import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({this.title});
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  YoutubePlayerController _controller;

  Future<String> getJSONData() async {
    var url = 'http://tes-mobile.landa.id/index.php';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      // var data = jsonResponse['data'];
      setState(() {
        data = jsonResponse['data'];
      });
      print('JsonResponse: $data');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    print('Hit API Successfull');

    return "Successfull";
  }

  @override
  void initState() {
    getJSONData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SHOULD ADD THIS TO COLUMN IN HERE, WITH LIST VIEW
      // Image.network('http://tes-mobile.landa.id/top_home.png')

      body: Container(
        child: _buildListView(),
      ),
    );
  }

  Widget _buildListView() {
    _controller = YoutubePlayerController(
      initialVideoId: 'hKXyjyQhqSU',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );

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
                        title: Text("Youtube Video"),
                        content: YoutubePlayer(
                          controller: _controller,
                          showVideoProgressIndicator: true,
                        ),
                      );
                    });
                print(data[index]['detail'][index]['youtube_url']);
              });
            },
          );
        });
  }

  Widget _buildImageColumn(dynamic item) => Container(
        decoration: BoxDecoration(
          color: Colors.blue[50],
        ),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            _buildRow(item),
            CachedNetworkImage(
              imageUrl: "http://tes-mobile.landa.id/top_home.png",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ],
        ),
      );

  Widget _buildRow(dynamic item) {
    return ListTile(
      title: Text(
        item['nama'] == null ? '' : item['nama'],
      ),
    );
  }
}
