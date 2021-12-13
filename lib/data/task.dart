class Task {
  int id;
  String title;
  String description;
  bool isEnabled;
  bool finished;

  Task.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        finished = json['finish'],
        id = json['id'];

  static List<Task> parseTasks(dynamic json) {
    List<Task> tasks = [];
    json.forEach((v) => tasks.add(Task.fromJson(v)));
    return tasks;
  }
}
