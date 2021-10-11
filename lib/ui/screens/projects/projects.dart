import 'package:flutter/material.dart';
import 'package:ocee/ui/components/texts.dart';

class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ocee / Projets"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyTexts.h2("Projets suivis"),
              MyTexts.h2("Projets gérés")
            ],
          ),
        ));
  }
}
