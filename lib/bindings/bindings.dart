import 'dart:developer';

import 'package:get/instance_manager.dart';
import 'package:ocee/controllers/authentication.dart';
import 'package:ocee/controllers/project.dart';
import 'package:ocee/services/authentication.dart';
import 'package:ocee/services/project.dart';

class MyBindigs implements Bindings {
  @override
  void dependencies() {
    // Services
    final AuthenticationService authenticationService =
        new AuthenticationService();

    final ProjectService projectService = new ProjectService();

    Get.lazyPut<AuthenticationController>(
        () => AuthenticationController(
            authenticationService: authenticationService),
        fenix: true);

    Get.lazyPut<ProjectController>(
        () => ProjectController(projectService: projectService),
        fenix: true);
  }
}
