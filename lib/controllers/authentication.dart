import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:ocee/services/authentication.dart';
import 'package:http/http.dart' as http;

class AuthenticationController extends GetxController {
  final AuthenticationService authenticationService;

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Rx<String> username = "".obs;
  Rx<String> password = "".obs;

  // Constructor
  AuthenticationController({@required this.authenticationService})
      : assert(authenticationService != null);

  Future<bool> login() async {
    http.Response response = await authenticationService.login(
      body: (<String, String>{
        'email': this.username.value.toString(),
        'password': this.password.value.toString(),
      }),
    );
    if (response.statusCode == 200) {
      Get.toNamed("/projects");
      return true;
    } else {
      return false;
    }
  }
}
