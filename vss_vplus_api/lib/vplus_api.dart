import 'dart:convert';

import 'package:http/http.dart' as http;

import 'vplus_ppd_result_model.dart';
import 'vplus_get_result_model.dart';

class VplusApi {
  static Future<VplusGetResultModel> get(String uri) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final http.Response response =
        await http.get(Uri.parse(uri), headers: headers);

    if (response.statusCode == 200) {
      return VplusGetResultModel.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>);
    } else {
      return VplusGetResultModel.fromJson({});
    }
  }

  static Future<VplusPpdResultModel> post(String uri,
      {Map<String, String>? headers, Object? body}) async {
    if (headers == null) {
      headers = <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      };
    } else {
      headers['Content-Type'] = 'application/json; charset=UTF-8';
    }
    final String bodyEncode = jsonEncode(body ?? {});
    final http.Response response =
        await http.post(Uri.parse(uri), headers: headers, body: bodyEncode);

    if (response.statusCode == 200) {
      return VplusPpdResultModel.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>);
    } else {
      return VplusPpdResultModel.fromJson({});
    }
  }
}
