import 'dart:developer';

import 'package:get/instance_manager.dart';
import 'package:ocee/controllers/authentication.dart';
import 'package:ocee/services/authentication.dart';

class MyBindigs implements Bindings {
  @override
  void dependencies() {
    final AuthenticationService authenticationService =
        new AuthenticationService();

    Get.lazyPut<AuthenticationController>(
        () => AuthenticationController(
            authenticationService: authenticationService),
        fenix: true);
  }
}
