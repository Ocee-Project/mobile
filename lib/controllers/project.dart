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
    // projectService.getManagedProjects();
    List<Project> projects = [];
    projects.add(new Project(
        title: "Projet Michelin",
        description: "C'est le projet michelin",
        client: "Michelin"));

    projects.add(new Project(
        title: "Projet Leroy Merlin",
        description: "C'est le projet lm",
        client: "Leroy Merlin"));

    return projects;
  }
}
