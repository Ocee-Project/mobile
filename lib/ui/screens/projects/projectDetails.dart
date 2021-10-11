import 'package:flutter/material.dart';
import 'package:ocee/data/project.dart';
import 'package:ocee/ui/components/texts.dart';

class ProjectDetailsPage extends StatelessWidget {
  Project project;

  ProjectDetailsPage({Key key, this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Ocee / ${project.title}")),
        body: SingleChildScrollView(
            child: Column(
          children: [
            MyTexts.h1(project.title),
            MyTexts.h2(project.description)
          ],
        )));
  }
}
