import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

// class NetworkHelper {
//   // List data;
//   // NetworkHelper({this.data});
//
//   Future<String> getData() async {
//     var url = 'http://tes-mobile.landa.id/index.php';
//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       var jsonResponse = convert.jsonDecode(response.body);
//       var data = jsonResponse['data'];
//       // setState(() {
//       //   data = jsonResponse['data'];
//       // });
//       // var data = jsonResponse['data'];
//       print('JSON RESPONSE: $data.');
//       return data;
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//     return "success";
//   }
// }

// class NetworkHelper {
//   NetworkHelper(this.url);
//
//   final String url;
//
//   Future getData() async {
//     http.Response response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       String data = response.body;
//       print(data);
//       return jsonDecode(data);
//     } else {
//       print(response.statusCode);
//     }
//   }
// }
