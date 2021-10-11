import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  static String baseUrl = "ocee-api.azurewebsites.net";
  static String api = "api";

  /// Generic get request
  static get({url, params}) async {
    return http.get(Uri.https(baseUrl, "$api/$url", params));
  }

  /// Generic put request
  static put({url, body}) async {
    return http.put(Uri.https(baseUrl, "$api/$url"), body: body);
  }

  /// Generic post request
  static post({url, body}) async {
    return http.post(Uri.https(baseUrl, "$api/$url"),
        headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
  }

  /// Generic delete request
  static delete({url, body}) async {
    return http.delete(Uri.https(baseUrl, "$api/$url"), body: body);
  }
}
