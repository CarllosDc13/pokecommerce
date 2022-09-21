import 'package:flutter/material.dart';
import 'package:pokecommerce/app_controller.dart';
import 'package:pokecommerce/themes/index.dart';
import 'package:popover/popover.dart';

@immutable
class PokeAppBar extends StatelessWidget {
  final String typeImg;

  const PokeAppBar({super.key, required this.typeImg});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        child: const Text('Pokecommerce'),
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
            // onTap: () {
            //   showPopover(
            //     context: context,
            //     transitionDuration: const Duration(milliseconds: 150),
            //     bodyBuilder: (context_) => const ListItems(),
            //     onPop: () => print('Popover was popped!'),
            //     direction: PopoverDirection.right,
            //     width: 200,
            //     height: 400,
            //     arrowHeight: 15,
            //     arrowWidth: 30,
            //   );
            // },
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
    );
  }
}
