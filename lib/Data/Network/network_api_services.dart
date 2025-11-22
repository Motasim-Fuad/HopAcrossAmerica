import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:hopacrossamerica/Data/exceptation_handle.dart';
import 'package:http/http.dart' as http;
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    //jodi kisue print korta chai toba ai vaba print korbo
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10));
      // backend devoloper bola diba time out a koto second hoba

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut("");
    }

    return responseJson;
  }

  Future<dynamic> postApi(var data, String url) async {
    //jodi kisue print korta chai toba ai vaba print korbo
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(url),

            body:
                data, // jsonEncode(data),//jodi row from a hoy taila body ai vaba

            // row from a na hola , body:data, ai hoba
          )
          .timeout(const Duration(seconds: 10));
      // backend devoloper bola diba time out a koto second hoba

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut("");
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FatchDataExceptation(" " + response.statusCode.toString());
    }
  }
}
