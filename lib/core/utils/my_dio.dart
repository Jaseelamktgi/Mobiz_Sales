import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api_paths.dart';

class ApiService {
  ///=======================[GET]==================================

  static Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final uri = Uri.parse(
        ApiPaths.baseUrl + endpoint,
      ).replace(queryParameters: queryParams);
      debugPrint("API HIT: $uri");
      final response = await http.get(uri);

      return _handleResponse(response);
    } catch (e) {
      throw Exception("GET Error: $e");
    }
  }

  ///=======================[POST]==================================

  static Future<dynamic> post({
    required String endpoint,
    Map<String, dynamic>? body,
  }) async {
    try {
      final uri = Uri.parse(ApiPaths.baseUrl + endpoint);
      debugPrint("API HIT: $uri");
      debugPrint("BODY: $body");

      final response = await http.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      return _handleResponse(response);
    } catch (e) {
      throw Exception("POST Error: $e");
    }
  }

  ///=======================[Response Handler]==================================

  static dynamic _handleResponse(http.Response response) {
    final data = jsonDecode(response.body);

    debugPrint("STATUS CODE: ${response.statusCode}");
    debugPrint("RESPONSE BODY: ${response.body}");

    if (response.statusCode == 200) {
      return data;
    } else {
      return {
        "status": "error",
        "message": data['message'] ?? "Something went wrong",
      };
    }
  }
}
