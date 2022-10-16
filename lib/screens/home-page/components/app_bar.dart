import 'package:flutter/material.dart';
import 'package:pokecommerce/app_controller.dart';
import 'package:pokecommerce/themes/index.dart';
import 'package:pokecommerce/themes/index.dart';

class PokeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String typeImg;

  const PokeAppBar({super.key, required this.typeImg});
  
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        child: Text(
            'Pokecommerce ${AppController.instance.pokeGenericResponse.results?.length}'),
        onTap: () {
          AppController.instance.alterTheme(ThemeType.pokeBall);
        },
      ),
      backgroundColor: AppController.instance.themeDefault.primaryColor,
      actions: [
        PopupMenuButton<ThemeType>(
            // Callback that sets the selected popup menu item.
            offset: const Offset(0, 8),
            constraints: const BoxConstraints.expand(width: 70, height: 170),
            onSelected: (ThemeType type) {
              AppController.instance.alterTheme(type);
            },
            position: PopupMenuPosition.under,
            child: Image.asset(
              "assets/images/$typeImg" "_bottom.png",
              height: 37,
              width: 37,
            ),
            itemBuilder: (BuildContext context) => [
                  PopupMenuItem<ThemeType>(
                      value: ThemeType.poke,
                      child: Image.asset(
                        "assets/images/poke_bottom.png",
                        height: 37,
                        width: 37,
                      )),
                  PopupMenuItem<ThemeType>(
                      value: ThemeType.pokeBall,
                      child: Image.asset(
                        "assets/images/pokeball.png",
                        height: 37,
                        width: 37,
                      )),
                  PopupMenuItem<ThemeType>(
                      value: ThemeType.ultraBall,
                      child: Image.asset(
                        "assets/images/ultraball.png",
                        height: 37,
                        width: 37,
                      )),
                ]),
        // Container(
        //   padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
        //   child: GestureDetector(
        //     child: Image.asset(
        //       "assets/images/$typeImg" "_bottom.png",
        //       height: 37,
        //       width: 37,
        //     ),
        //     onTap: () {
        //       showPopover(
        //         context: context,
        //         transitionDuration: const Duration(milliseconds: 150),
        //         bodyBuilder: (context) => const ListItems(),
        //         onPop: () => print('Popover was popped!'),
        //         direction: PopoverDirection.bottom,
        //         width: 70,
        //         height: 170,
        //         arrowHeight: 15,
        //         arrowWidth: 30,
        //       );
        //     },
        //   ),
        // ),
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
    );
  }
}
