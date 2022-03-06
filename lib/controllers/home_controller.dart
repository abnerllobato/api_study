import 'package:api_study/models/github_repository_model.dart';
import 'package:api_study/service/json_github_service.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final JsonGitHubService _service;

  HomeController(this._service);

  var repositories = <GitHubRepositoryModel>[];

  Future<void> fetchAllRepo() async {
    repositories = await _service.getRepository();
    notifyListeners();
  }
}
