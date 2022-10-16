import 'package:flutter/material.dart';
import 'package:pokecommerce/app_controller.dart';

// import 'screens/pop.dart';
import 'screens/home-page/home_page.dart';
import 'package:localstorage/localstorage.dart';

class AppWidget extends StatelessWidget {
  final LocalStorage? storage = LocalStorage('pokemons_links');
  // const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    storage?.setItem("app_init", true);
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(primarySwatch: Colors.cyan, fontFamily: "Mellow"),
            home: HomePage(),
          );
        });
  }
}
