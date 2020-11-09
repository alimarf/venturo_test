import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() {
  BelajarModel().getBelajar();
}

// class NetworkHelper {
//   Future getAllData() async {
//     var url = 'http://tes-mobile.landa.id/index.php';
//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       var jsonResponse = convert.jsonDecode(response.body);
//       var data = jsonResponse['data'];
//       print('JSON RESPONSE: $data.');
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   }
// }

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return convert.jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

class BelajarModel {
  Future<dynamic> getBelajar() async {
    var url = 'http://tes-mobile.landa.id/index.php';
    NetworkHelper network = NetworkHelper(url);

    var belajarData = await network.getData();
    print(belajarData);
    return belajarData;
  }
}
