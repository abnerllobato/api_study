import 'package:api_study/service/http_client_l.dart';
import 'package:dio/dio.dart';

class DioClient implements IHttpClient {
  final dio = Dio();

  @override
  Future<List<dynamic>> get(String url) async {
    final response = await dio.get(url);
    return response.data;
  }
}
