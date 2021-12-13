import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocee/controllers/project.dart';
import 'package:ocee/data/project.dart';
import 'package:ocee/ui/components/appbar.dart';
import 'package:ocee/ui/components/loader.dart';
import 'package:ocee/ui/components/texts.dart';
import 'package:ocee/utils/constants.dart';

class ProjectsPage extends StatelessWidget {
  ProjectController projectController = Get.find<ProjectController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: "Ocee / Projets"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyTexts.h2("Projets suivis"),
              ),
              FutureBuilder(
                future: projectController.getFollowedProjects(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.length > 0) {
                      return projectList(
                          projects: snapshot.data, managed: false);
                    } else {
                      return MyTexts.p(
                          "Vous ne suivez aucun projet pour l'instant");
                    }
                  } else {
                    return loader();
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyTexts.h2("Projets gérés"),
              ),
              FutureBuilder(
                future: projectController.getManagedProjects(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return projectList(projects: snapshot.data, managed: true);
                  } else {
                    return loader();
                  }
                },
              ),
            ],
          ),
        ));
  }

  projectList({List<Project> projects, bool managed}) {
    List<Widget> projectList = [];

    if (managed)
      projectList.add(projectItem(
          child: newProjectContent(), onPress: projectController.newProject));

    projects.forEach((Project p) {
      projectList.add(projectItem(
          project: p,
          managed: managed,
          child: projectContent(managed: managed, project: p)));
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: projectList),
    );
  }

  Widget projectItem(
      {Project project, bool managed = true, Widget child, Function onPress}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: Get.width * 0.8,
        child: Material(
          color: managed
              ? MyColors.violetHighlighted
              : MyColors.lavenderHighlighted,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            highlightColor: managed
                ? MyColors.violetHighlighted
                : MyColors.lavenderHighlighted,
            borderRadius: BorderRadius.circular(20),
            child: child,
            onTap: () {
              onPress != null
                  ? onPress()
                  : projectController.openDetails(project);
            },
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  Widget newProjectContent() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("+", style: TextStyle(color: MyColors.white, fontSize: 52)),
          Text("Ajouter un projet",
              style: TextStyle(color: MyColors.white, fontSize: 20))
        ],
      ),
    );
  }

  Widget projectContent({Project project, managed = true}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(project.title,
                style: TextStyle(
                    color: managed ? MyColors.white : MyColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          Divider(),
          Text(project.description,
              style: TextStyle(
                  color: managed ? MyColors.white : MyColors.black,
                  fontSize: 16))
        ],
      ),
    );
  }
}
