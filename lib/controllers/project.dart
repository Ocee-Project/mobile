import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:ocee/data/project.dart';
import 'package:ocee/services/authentication.dart';
import 'package:http/http.dart' as http;
import 'package:ocee/services/project.dart';

class ProjectController extends GetxController {
  final ProjectService projectService;

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Rx<String> username = "".obs;
  Rx<String> password = "".obs;

  // Constructor
  ProjectController({@required this.projectService})
      : assert(projectService != null);

  Future<List<Project>> getManagedProjects() async {
    final response = await projectService.getManagedProjects();
    return parseProjects(response.body);
  }

  Future<List<Project>> getFollowedProjects() async {
    final response = await projectService.getFollowedProjects();
    return parseProjects(response.body);
  }

  List<Project> parseProjects(String body) {
    List<Project> projects = [];

    jsonDecode(body).forEach((dynamic p) {
      projects.add(Project.fromJson(p));
    });

    return projects;
  }

  void newProject() {
    Get.snackbar("Ajouter un projet", "Indisponible sur l'application mobile");
  }
}
