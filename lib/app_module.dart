import 'package:api_study/controllers/home_controller.dart';
import 'package:api_study/service/dio_client.dart';
import 'package:api_study/service/http_client_l.dart';
import 'package:api_study/service/json_github_service.dart';
import 'package:api_study/views/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<IHttpClient>((i) => DioClient()),
        Bind.singleton((i) => JsonGitHubService(i())),
        Bind.singleton((i) => HomeController(i())),
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (_, __) => const HomePage())];
}
