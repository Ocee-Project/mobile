import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:ocee/services/authentication.dart';
import 'package:http/http.dart' as http;
import 'package:ocee/utils/instances.dart';

class AuthenticationController extends GetxController {
  final AuthenticationService authenticationService;

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Rx<String> username = "".obs;
  Rx<String> password = "".obs;
  Rx<bool> loading = false.obs;

  // Constructor
  AuthenticationController({@required this.authenticationService})
      : assert(authenticationService != null);

  Future<bool> login() async {
    loading.value = true;

    http.Response response = await authenticationService.login(
      body: (<String, String>{
        'email': this.username.value.toString(),
        'password': this.password.value.toString(),
      }),
    );
    if (response.statusCode == 200) {
      Instances.box.write("token", jsonDecode(response.body)["token"]);
      loading.value = false;

      Get.toNamed("/projects");
      return true;
    } else {
      Get.snackbar("Connexion", "Une erreur est survenue à la connexion");
      loading.value = false;

      return false;
    }
  }
}
