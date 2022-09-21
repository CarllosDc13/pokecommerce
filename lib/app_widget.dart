import 'package:flutter/material.dart';
import 'package:pokecommerce/app_controller.dart';

import 'screens/home-page/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
