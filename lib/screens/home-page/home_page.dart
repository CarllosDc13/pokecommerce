import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokecommerce/entity/pokeget.dart';
import 'package:pokecommerce/app_controller.dart';
import 'package:pokecommerce/entity/pokeinfos.dart';
import 'package:pokecommerce/themes/index.dart';
import 'package:popover/popover.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    if (AppController.instance.pokeGenericResponse.count == 0) {
      AppController.instance.getLinks();
    }
    // if ((AppController.instance.pokeGenericResponse.results?.length ?? 0) >=
    //     AppController.instance.pokeGenericResponse.count) {
    //   AppController.instance.getPokeinfos(AppController
    //           .instance.pokeGenericResponse.results
    //           ?.sublist(1, 20)
    //           .map((e) => e.name)
    //           .toList() ??
    //       []);
    // }

    print(_controller);

    String typeImg =
        AppController.instance.themeDefault.themeType.name.toLowerCase();

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          child: Text(
              'Pokecommerce ${AppController.instance.pokeGenericResponse.results?.length}'),
          onTap: () {
            AppController.instance.alterTheme(ThemeType.pokeBall);
          },
        ),
        backgroundColor: AppController.instance.themeDefault.primaryColor,
        actions: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: GestureDetector(
              child: Image.asset(
                "assets/images/$typeImg" "_bottom.png",
                height: 37,
                width: 37,
              ),
              onTap: () {
                showPopover(
                  context: context,
                  transitionDuration: const Duration(milliseconds: 150),
                  bodyBuilder: (context_) => const ListItems(),
                  onPop: () => print('Popover was popped!'),
                  direction: PopoverDirection.right,
                  width: 200,
                  height: 400,
                  arrowHeight: 15,
                  arrowWidth: 30,
                );
              },
            ),
          ),
        ],
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(-0.6, 1.1),
              blurRadius: 3.0,
              color: Color.fromARGB(255, 29, 44, 95),
            ),
            Shadow(
              offset: Offset(-0.4, -0.1),
              blurRadius: 1.0,
              color: Color.fromARGB(255, 29, 44, 95),
            ),
          ],
          fontSize: 25,
        ),
      ),
      backgroundColor: AppController.instance.themeDefault.backgroundThemeColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
        child: Align(
            alignment: Alignment.topCenter,
            child: ListView(
              controller: _controller,
              children: (AppController.instance.pokeGenericResponse.results)
                      ?.map((item) {
                    var info = AppController.instance.pokeinfo.firstWhere(
                        (pi) => (pi.name ?? '') == item.name,
                        orElse: () => Pokeinfo());
                    return ItemEcommerce(name: item.name, image: info.sprites?.frontDefault);
                  }).toList() ??
                  [],
            )),
      ),
    );
  }
}

class ItemEcommerce extends StatelessWidget {
  const ItemEcommerce({super.key, this.name, this.image});

  final String? name;
  final String? image;

  @override
  Widget build(BuildContext context) {
    print(image);
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        height: 105,
        child: Row(
          children: [
            Image.network(
              image ?? 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png',
              height: 75,
              width: 75,
            ),
            Container(
              child: Row(
                children: [Text(name ?? '')],
              ),
            )
          ],
        ));
  }
}

class ListItems extends StatelessWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context)
                  ..pop()
                  ..push(
                    MaterialPageRoute<SecondRoute>(
                      builder: (context) => SecondRoute(),
                    ),
                  );
              },
              child: Container(
                height: 50,
                color: Colors.amber[100],
                child: const Center(child: Text('Entry A')),
              ),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.amber[200],
              child: const Center(child: Text('Entry B')),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.amber[300],
              child: const Center(child: Text('Entry C')),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
