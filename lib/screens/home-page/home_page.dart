import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokecommerce/components/pokeTag.dart';
import 'package:pokecommerce/entity/pokeget.dart';
import 'package:pokecommerce/screens/home-page/components/app_bar.dart';
import 'package:pokecommerce/app_controller.dart';
import 'package:pokecommerce/entity/pokeinfos.dart';
import 'package:pokecommerce/themes/index.dart';
import 'package:popover/popover.dart';
import 'package:string_extensions/string_extensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    if (AppController.instance.pokeGenericResponse.count  == 0) {
      AppController.instance.getLinks();
    }

    String typeImg =
        AppController.instance.themeDefault.themeType.name.toLowerCase();

    return Scaffold(
      appBar: PokeAppBar(typeImg: typeImg),
      backgroundColor: AppController.instance.themeDefault.backgroundThemeColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
        child: Align(
            alignment: Alignment.topCenter,
            child: ListView(
              children: (AppController.instance.pokeGenericResponse.results)
                      ?.map((item) {
                    var info = AppController.instance.pokeinfos.firstWhere(
                        (pi) => (pi.name ?? '') == item.name,
                        orElse: () => Pokeinfo());
                    return ItemEcommerce(
                        name: item.name,
                        image: info.sprites?.frontDefault,
                        pkTypes: info.types);
                  }).toList() ??
                  [],
            )),
      ),
    );
  }
}

class ItemEcommerce extends StatelessWidget {
  const ItemEcommerce({super.key, this.name, this.image, this.pkTypes});

  final String? name;
  final String? image;
  final List<PokeTypes>? pkTypes;

  @override
  Widget build(BuildContext context) {
    print(pkTypes?.map((e) => e.toJson()));
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        height: 105,
        child: Row(
          children: [
            Image.network(
              image ??
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png',
              height: 75,
              width: 105,
            ),
            Container(
                child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                    child: Text(
                      name.capitalize ?? '',
                      style: const TextStyle(
                          fontSize: 23, fontWeight: FontWeight.w600),
                    )),
                Row(
                    children: pkTypes?.map((type) {
                          var pkType = AppController
                              .instance.themeDefault.pokeTypesColors
                              .singleWhere(
                                  (pkColor) => pkColor.type == type.type?.name);
                          return Container(
                              margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: PokeTag(
                                text: type.type?.name,
                                textColor: pkType.textColor.name,
                                color: pkType.color,
                              ));
                        }).toList() ??
                        [])
              ],
            ))
          ],
        ));
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
