import 'package:api_study/models/github_repository_model.dart';
import 'package:api_study/service/http_client_l.dart';

const url = 'https://api.github.com/repositories';

class JsonGitHubService {
  final IHttpClient client;

  JsonGitHubService(this.client);

  Future<List<GitHubRepositoryModel>> getRepository() async {
    final response = await client.get(url);
    final body = response;
    final repositories =
        body.map((map) => GitHubRepositoryModel.fromJson(map)).toList();

    return repositories;
  }
}
