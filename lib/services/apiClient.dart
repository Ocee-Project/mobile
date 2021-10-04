import 'package:http/http.dart' as http;

class ApiClient {
  static String baseUrl = "https://localhost:44391/api";

  /// Generic get request
  static get({url, params}) async {
    return http.get(Uri.https(baseUrl, "$baseUrl/$url", params));
  }

  /// Generic put request
  static put({url, body}) async {
    return http.put(Uri.https(baseUrl, "$baseUrl/$url"), body: body);
  }

  /// Generic post request
  static post({url, body}) async {
    return http.post(Uri.https(baseUrl, "$baseUrl/$url"), body: body);
  }

  /// Generic delete request
  static delete({url, body}) async {
    return http.delete(Uri.https(baseUrl, "$baseUrl/$url"), body: body);
  }
}
