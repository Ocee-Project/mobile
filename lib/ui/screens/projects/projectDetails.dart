import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocee/controllers/project.dart';
import 'package:ocee/data/project.dart';
import 'package:ocee/ui/components/appbar.dart';
import 'package:ocee/ui/components/loader.dart';
import 'package:ocee/ui/components/texts.dart';
import 'package:ocee/data/step.dart' as step;
import 'package:ocee/utils/constants.dart';

class ProjectDetailsPage extends StatelessWidget {
  Project project;

  ProjectDetailsPage({Key key, this.project});

  @override
  Widget build(BuildContext context) {
    ProjectController projectController = Get.find<ProjectController>();
    return Scaffold(
        appBar: appbar(title: "Ocee / ${project.title}"),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTexts.h2("${project.title} - ${project.client}"),
              MyTexts.p(project.description),
              const SizedBox(
                height: 16,
              ),
              const Divider(),
              const Center(
                child: Text("Étapes du projet",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 16,
              ),
              FutureBuilder(
                future: projectController.getProjectDetails(project.id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.length > 0) {
                      return showSteps(snapshot.data);
                    } else {
                      return const Text("Pas encore d'étapes");
                    }
                  }
                  return loader();
                },
              )
            ],
          ),
        )));
  }

  Widget showSteps(List<step.Step> steps) {
    return Column(
      children: steps.map((s) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ExpandablePanel(
                theme: ExpandableThemeData(
                    iconColor: MyColors.violet,
                    iconPadding: EdgeInsets.zero,
                    tapBodyToCollapse: true,
                    tapHeaderToExpand: true),
                header: Text(
                  s.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(s.description),
                    const Divider(),
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: s.tasks.map((t) {
                        return ListTile(
                          title: Text(t.title),
                          subtitle: Text(t.description),
                          leading: t.finished ? Icon(Icons.check) : null,
                        );
                      }).toList(),
                    ),
                  ],
                ),
                collapsed: null,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
