class Task {
  int id;
  String title;
  String description;
  bool isEnabled;

  Task.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        id = json['id'];

  static List<Task> parseTasks(dynamic json) {
    List<Task> tasks = [];
    json.forEach((v) => tasks.add(Task.fromJson(v)));
    return tasks;
  }
}
