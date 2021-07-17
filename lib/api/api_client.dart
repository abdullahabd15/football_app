import 'dart:convert';

import 'package:football_app/api/response.dart';
import 'package:football_app/constant/constants.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client _httpClient = http.Client();
  final String _unknownErrorMessage = Constants.unknownErrorMessage;

  Future<Response> get(String url) async {
    var apiUrl = Uri.parse("${Constants.baseUrl}$url");
    try {
      var response = await _httpClient.get(apiUrl);
      if (response.statusCode == 200) {
        var map = jsonDecode(response.body);
        return Response(data: map);
      } else {
        return Response(
            errorMessage: response.reasonPhrase ?? _unknownErrorMessage);
      }
    } catch (e) {
      return Response(errorMessage: e?.toString() ?? _unknownErrorMessage);
    }
  }
}
