import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ocee/services/apiClient.dart';

class AuthenticationService {
  Future<String> hello() async {
    await Future.delayed(Duration(seconds: 1));
    return "Salut mec";
  }

  Future<http.Response> getCoucou() async {
    return await ApiClient.get(url: 'coucou');
  }
}
