import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:ocee/services/authentication.dart';

class AuthenticationController extends GetxController {
  final AuthenticationService authenticationService;

  // Constructor
  AuthenticationController({@required this.authenticationService})
      : assert(authenticationService != null);

  var num = 0.obs;

  Future<String> getHelloMessage() {
    return authenticationService.hello();
  }

  void increment() {
    this.num.value++;
  }
}
