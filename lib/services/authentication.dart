import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ocee/services/apiClient.dart';

class AuthenticationService {
  Future<http.Response> login({body}) async {
    return await ApiClient.post(url: 'authentication/authenticate', body: body);
  }
}
