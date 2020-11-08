import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:io';

void main() {
  getJSONData();
}

Future<String> getJSONData() async {
  var url = 'anu';

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    // var data = jsonResponse['data'];
    // setState(() {
    //   data = jsonResponse['data'];
    // });
    print('JsonResponse: $jsonResponse');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  print('Hit API Successfull');

  return "Successfull";
}
