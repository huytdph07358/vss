import 'dart:convert';

import 'package:http/http.dart' as http;

import 'tourism_get_result_model.dart';

class TourismApi {
  static Future<TourismGetResultModel> get(String uri) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final http.Response response =
        await http.get(Uri.parse(uri), headers: headers);

    if (response.statusCode == 200) {
      return TourismGetResultModel.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>);
    } else {
      return TourismGetResultModel.fromJson({});
    }
  }
}
