import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:ostadprojects/Data/Model/response_data.dart';

class NetworkCaller {
 static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      debugPrint(url);
      final Response response = await get(uri);
      responsePrint(url, response);
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodedData);
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
          isSuccess: false, statusCode: -1, errorMassage: e.toString());
    }
  }

 static Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      debugPrint(url);
      final Response response = await post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      responsePrint(url, response);
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodedData);
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
          isSuccess: false, statusCode: -1, errorMassage: e.toString());
    }
  }

 static void responsePrint(String url, Response response) {
    debugPrint(
      'URL: $url\nStatus code: ${response.statusCode}\nResponse Body: ${response.body}',
    );
  }
}
