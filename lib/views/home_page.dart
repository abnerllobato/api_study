import 'package:api_study/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.fetchAllRepo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Repositório'),
        ),
        body: AnimatedBuilder(
          animation: controller,
          builder: (context, widget) {
            return ListView.builder(
                itemCount: controller.repositories.length,
                itemBuilder: ((context, index) {
                  final repositories = controller.repositories[index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      child: Image.network(
                        repositories.owner!.avatarUrl.toString(),
                      ),
                    ),
                    title: Text(repositories.name.toString()),
                    subtitle: Text(repositories.description.toString()),
                  );
                }));
          },
        ));
  }
}
