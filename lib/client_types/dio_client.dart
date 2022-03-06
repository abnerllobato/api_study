import 'package:dio/dio.dart';

dioClient() async {
  var url = 'https://api.github.com/repositories';
  final response = await Dio().get(url);
  print(response.data);
}
