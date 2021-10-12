import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:ocee/controllers/connectivity.dart';
import 'package:ocee/utils/instances.dart';

class ApiClient {
  static String baseUrl = "ocee-api.azurewebsites.net";
  static String api = "api";

  static Future<Map<String, String>> headers() async {
    var headers = {"Content-Type": "application/json"};

    var token = await Instances.box.read("token");
    headers.addAll({"Authorization": "Bearer ${token}"});

    return headers;
  }

  /// Generic get request
  static get({url, params}) async {
    checkConnectivity();
    return http.get(Uri.https(baseUrl, "$api/$url", params),
        headers: await headers());
  }

  /// Generic put request
  static put({url, body}) async {
    checkConnectivity();
    return http.put(Uri.https(baseUrl, "$api/$url"), body: body);
  }

  /// Generic post request
  static post({url, body}) async {
    checkConnectivity();
    return http.post(Uri.https(baseUrl, "$api/$url"),
        headers: await headers(), body: jsonEncode(body));
  }

  /// Generic delete request
  static delete({url, body}) async {
    checkConnectivity();
    return http.delete(Uri.https(baseUrl, "$api/$url"), body: body);
  }

  static checkConnectivity() {
    if (Get.find<ConnectivityController>().connected()) {
      return true;
    } else {
      Get.snackbar("Internet", "Vous n'êtes pas connectés à Internet");
      throw Exception(
        "Connectivity error",
      );
    }
  }
}
