import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:ocee/data/project.dart';
import 'package:ocee/data/step.dart' as step;
import 'package:ocee/services/authentication.dart';
import 'package:http/http.dart' as http;
import 'package:ocee/services/project.dart';
import 'package:ocee/ui/screens/projects/projectDetails.dart';

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
    await Future.delayed(const Duration(seconds: 1));
    return parseProjects(response.body);
  }

  Future<List<Project>> getFollowedProjects() async {
    final response = await projectService.getFollowedProjects();
    await Future.delayed(const Duration(seconds: 1));
    return parseProjects(response.body);
  }

  List<Project> parseProjects(String body) {
    List<Project> projects = [];

    jsonDecode(body).forEach((dynamic p) {
      projects.add(Project.fromJson(p));
    });

    return projects;
  }

  Future<dynamic> getProjectDetails(int id) async {
    final response = await projectService.getProjectDetails(id.toString());
    await Future.delayed(const Duration(seconds: 1));

    List<step.Step> steps = [];
    jsonDecode(response.body)
        .forEach((s) => {steps.add(step.Step.fromJson(s))});

    return steps;
  }

  // NAVIGATION

  void newProject() {
    Get.snackbar("Ajouter un projet", "Indisponible sur l'application mobile");
  }

  void openDetails(Project project) {
    Get.to(() => ProjectDetailsPage(
          project: project,
        ));
  }
}
