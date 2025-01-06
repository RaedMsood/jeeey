import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jeeey/core/network/urls.dart';
import '../../services/auth/auth.dart';

class RemoteRequest {
  static late Dio dio;

  static initDio() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppURL.baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    dynamic query,
    String lang = 'ar',
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': 'Bearer ${Auth().token}',
    };
    final response = await dio.get(url, queryParameters: query);
    debugPrint(response.statusCode.toString());
    debugPrint(response.data.toString());

    if (response.statusCode == 200) {
      return response;
    } else {
      debugPrint(response.statusCode.toString());
      throw Exception();
    }
  }

  static Future<Response> postData({
    required String path,
    Map<String, dynamic>? query,
    dynamic data,
    String lang = 'ar',
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': 'Bearer ${Auth().token}',
    };
    final response =
        await dio.post(path, queryParameters: query, data: jsonEncode(data));

    if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202) {
      debugPrint(response.data.toString());
      debugPrint(response.statusCode.toString());
      return response;
    } else {
      print(response);
      throw Exception();
    }
  }
}
