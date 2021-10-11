import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocee/controllers/project.dart';
import 'package:ocee/data/project.dart';
import 'package:ocee/ui/components/loader.dart';
import 'package:ocee/ui/components/texts.dart';

class ProjectDetailsPage extends StatelessWidget {
  Project project;

  ProjectDetailsPage({Key key, this.project});

  @override
  Widget build(BuildContext context) {
    print(project.id);
    ProjectController projectController = Get.find<ProjectController>();
    return Scaffold(
        appBar: AppBar(title: Text("Ocee / ${project.title}")),
        body: SingleChildScrollView(
            child: Column(
          children: [
            MyTexts.h1(project.title),
            MyTexts.h2(project.description),
            FutureBuilder(
              future: projectController.getProjectDetails(project.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text("snapshot.data");
                }
                return loader();
              },
            )
          ],
        )));
  }
}
