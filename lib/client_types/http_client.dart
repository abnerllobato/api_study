import 'package:http/http.dart' as http;

httpClientL() async {
  var url = ' https://api.github.com/repositories';
  final response = await http.get(Uri.parse(url));
  final body = response.body;
  print(body);
}
