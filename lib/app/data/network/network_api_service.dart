import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:restaurants_app/app/core/app_config/api_url.dart';

class NetworkApiService {
  // Base URL from AppConfig
  static final String baseUrl = ApiUrl.baseUrl;

  Map<String, String> _getHeaders({String? token}) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // --- 1. GET Request ---
  Future<dynamic> getApi(String endpoint, {String? token}) async {
    var responseJson;
    try {
      final response = await http.get(
        Uri.parse(baseUrl + endpoint),
        headers: _getHeaders(token: token),
      ).timeout(const Duration(seconds: 15));

      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('Request Time Out');
    }
    return responseJson;
  }

  // --- 2. POST Request ---
  Future<dynamic> postApi(String endpoint, dynamic data, {String? token}) async {
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(baseUrl + endpoint),
        body: jsonEncode(data),
        headers: _getHeaders(token: token),
      ).timeout(const Duration(seconds: 15));

      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('Request Time Out');
    }
    return responseJson;
  }

  // --- 3. PUT Request ---
  Future<dynamic> putApi(String endpoint, dynamic data, {String? token}) async {
    var responseJson;
    try {
      final response = await http.put(
        Uri.parse(baseUrl + endpoint),
        body: jsonEncode(data),
        headers: _getHeaders(token: token),
      ).timeout(const Duration(seconds: 15));

      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('Request Time Out');
    }
    return responseJson;
  }

  // --- 4. PATCH Request ---
  Future<dynamic> patchApi(String endpoint, dynamic data, {String? token}) async {
    var responseJson;
    try {
      final response = await http.patch(
        Uri.parse(baseUrl + endpoint),
        body: jsonEncode(data),
        headers: _getHeaders(token: token),
      ).timeout(const Duration(seconds: 15));

      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('Request Time Out');
    }
    return responseJson;
  }

  // --- 5. DELETE Request ---
  Future<dynamic> deleteApi(String endpoint, {dynamic data, String? token}) async {
    var responseJson;
    try {
      final response = await http.delete(
        Uri.parse(baseUrl + endpoint),
        body: data != null ? jsonEncode(data) : null,
        headers: _getHeaders(token: token),
      ).timeout(const Duration(seconds: 15));

      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('Request Time Out');
    }
    return responseJson;
  }




  // --- 6. Multipart Request (Multiple Files / Images Support) ---
  Future<dynamic> multipartApi(
      String endpoint, {
        required Map<String, String>? fields,
        required Map<String, String>? files, // fileFieldKey -> filePath
        String? token,
      }) async {
    var responseJson;
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(baseUrl + endpoint),
      );

      request.headers.addAll({
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      });

      if (fields != null) {
        request.fields.addAll(fields);
      }

      if (files != null && files.isNotEmpty) {
        for (var entry in files.entries) {
          if (entry.value.isNotEmpty) {
            var multipartFile = await http.MultipartFile.fromPath(
              entry.key, // Backend field name (e.g., 'logo', 'cover_photo')
              entry.value, // File local path
            );
            request.files.add(multipartFile);
          }
        }
      }

      var streamedResponse = await request.send().timeout(const Duration(seconds: 30));
      var response = await http.Response.fromStream(streamedResponse);

      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('Request Time Out');
    }
    return responseJson;
  }

  // --- Response Status Handler ---
  dynamic _returnResponse(http.Response response) {
    if (kDebugMode) print("Server Response Body (${response.statusCode}): ${response.body}"); // <-- এটি যোগ করুন

    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw Exception('Bad Request: ${response.body.toString()}');
      case 401:
      case 403:
        throw Exception('Unauthorized: ${response.body.toString()}');
      case 404:
        throw Exception('Not Found: ${response.body.toString()}');
      case 422: // 422 এরর হ্যান্ডেল করার জন্য আলাদা কেস যোগ করতে পারেন
        throw Exception('${response.body.toString()}'); // সার্ভারের আসল মেসেজ দেখার জন্য
      case 500:
      default:
        throw Exception('Server Error: Status Code ${response.statusCode}');
    }
  }
}