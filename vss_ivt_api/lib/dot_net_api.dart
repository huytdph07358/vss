import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:nb_utils/nb_utils.dart';

import 'api_consumer.dart';
import 'api_result_model.dart';

class DotNetApi {
  DotNetApi(
      {required this.applicationCode,
      this.tokenCode = '',
      this.languageCode = 'vi'});
  String tokenCode;
  String applicationCode;
  String languageCode;

  Future<ApiResultModel> post(String uri,
      {Map<String, String>? headers, Object? body}) async {
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
    final String bodyEncode = jsonEncode(body ?? {});
    final http.Response response =
        await http.post(Uri.parse(uri), headers: headers, body: bodyEncode);

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

  Future<ApiResultModel> postUnsafe(String uri,
      {Map<String, String>? headers, Object? body}) async {
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
    final String bodyEncode = jsonEncode(body ?? {});

    final context = SecurityContext.defaultContext;
    context.allowLegacyUnsafeRenegotiation = true;
    final HttpClient httpClient = HttpClient(context: context);
    final IOClient client = IOClient(httpClient);

    final http.Response response =
        await client.post(Uri.parse(uri), headers: headers, body: bodyEncode);

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

  Future postT(String uri, {Object? body, Map<String, String>? headers}) async {
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
    final String bodyEncode = jsonEncode(body ?? {});
    final http.Response response =
        await http.post(Uri.parse(uri), headers: headers, body: bodyEncode);

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else if (response.statusCode == 401) {
      if (ApiConsumer.onUnAuthorizeCallback != null) {
        ApiConsumer.onUnAuthorizeCallback!();
      }
      return ApiResultModel(Success: false);
    } else {
      return {};
    }
  }

  Future<ApiResultModel> get(String uri,
      {Map<String, String>? headers, dynamic param}) async {
    if (headers == null) {
      headers = <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'TokenCode': tokenCode,
        'ApplicationCode': applicationCode,
        'Accept-Language': languageCode,
      };
    } else {
      headers['Content-Type'] = 'application/json; charset=UTF-8';
      if(!headers.containsKey('MachineName')) {
        headers['TokenCode'] = tokenCode;
      }
      headers['ApplicationCode'] = applicationCode;
      headers['Accept-Language'] = languageCode;
    }
    headers['version'] = ApiConsumer.appVersion;
    String uriWithParam = uri;
    if (param != null) {
      final String paramObj = jsonEncode(<String, dynamic>{'ApiData': param});
      uriWithParam += '?param=${base64.encode(utf8.encode(paramObj))}';
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

  Future<ApiResultModel> getPaging(String uri,
      {Map<String, String>? headers,
      dynamic apiData,
      dynamic commonParam}) async {
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
    if (apiData != null) {
      final String paramObj = jsonEncode(
          <String, dynamic>{'ApiData': apiData, 'Param': commonParam});
      uriWithParam += '?param=${base64.encode(utf8.encode(paramObj))}';
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
