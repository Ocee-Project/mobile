import 'package:ocee/data/task.dart';

class Step {
  int id;
  String title;
  String description;
  List<Task> tasks;

  Step.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        tasks = Task.parseTasks(json["tasks"]),
        id = json['id'];
}
