import 'package:api_study/controllers/home_controller.dart';
import 'package:api_study/models/github_repository_model.dart';
import 'package:api_study/service/json_github_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class JsonGitHubServiceMock extends Mock implements JsonGitHubService {}

void main() {
  test('deve preencher a lista corretamente', () async {
    final service = JsonGitHubServiceMock();

    when(() => service.getRepository())
        .thenAnswer((_) async => [GitHubRepositoryModel.stub()]);
    final controller = HomeController(service);
    await controller.fetchAllRepo();
    expect(controller.repositories.length, 1);
  });
}
