import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ocee/services/apiClient.dart';

class ProjectService {
  Future<http.Response> getManagedProjects() async {
    return await ApiClient.get(url: 'projects/owners');
  }

  Future<http.Response> getFollowedProjects() async {
    return await ApiClient.get(url: 'projects/followers');
  }

  Future<http.Response> getProjectDetails(String id) async {
    return await ApiClient.get(url: 'projects/$id');
  }
}
