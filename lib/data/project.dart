import 'package:flutter/material.dart';

class Project {
  int id;
  String title;
  String description;
  String client;
  String image;

  Project({Key key, this.title, this.description, this.client, this.image});

  Project.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        client = json['client'],
        image = json['imageUrl'],
        id = json['id'];
}
