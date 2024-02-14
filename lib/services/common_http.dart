// import 'package:http/http.dart' as http;
// // import 'dart:developer' as dev;

// class CommonHttp {
//   // final String searchType;

//   CommonHttp();

//   Future<dynamic> get(String endpoint, String searchType) async {
//     final response = await http.get(Uri.parse(endpoint));

//     if (response.statusCode == 200) {
//       // dev.log(response.body);
//       return response.body;
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer' as dev;

class CommonHttp {
  final String baseUrl;
  final String authToken;

  CommonHttp(this.baseUrl, this.authToken);

  Future<dynamic> get(String endpoint) async {
    final response = await http.get(
      Uri.parse(endpoint),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(endpoint),
      body: jsonEncode(data),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $authToken",
      },
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      return response.body;
    }
  }
}
