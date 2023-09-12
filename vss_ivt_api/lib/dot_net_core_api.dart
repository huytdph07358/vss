import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';

import 'api_consumer.dart';
import 'api_result_model.dart';

class DotNetCoreApi {
  String tokenCode;
  String applicationCode;
  String languageCode;

  DotNetCoreApi(
      {required this.applicationCode,
      this.tokenCode = '',
      this.languageCode = 'vi'});

  Future<ApiResultModel> get(String uri,
      {Map<String, String>? headers, Map<String, String>? param}) async {
    if (headers == null) {
      headers = <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'TokenCode': tokenCode,
        'ApplicationCode': applicationCode,
        'Accept-Language': languageCode,
      };
    } else {
      headers['Content-Type'] = 'application/json; charset=UTF-8';
      headers['TokenCode'] = tokenCode;
      headers['ApplicationCode'] = applicationCode;
      headers['Accept-Language'] = languageCode;
    }
    headers['version'] = ApiConsumer.appVersion;
    String uriWithParam = uri;
    if (param != null) {
      final List<String> element = <String>[];
      param.forEach((String k, String v) => element.add('$k=$v'));
      uriWithParam += '?';
      for (int i = 0; i < element.length; i++) {
        uriWithParam += element[i];
        if (i < element.length - 1) {
          uriWithParam += '&';
        }
      }
    }

    final http.Response response =
        await http.get(Uri.parse(uriWithParam), headers: headers);

    if (response.statusCode == 200) {
      return ApiResultModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else if (response.statusCode == 401) {
      if (ApiConsumer.onUnAuthorizeCallback != null) {
        ApiConsumer.onUnAuthorizeCallback!();
      }
      return ApiResultModel(Success: false);
    } else {
      return ApiResultModel.fromJson({});
    }
  }
}
