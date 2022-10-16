import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class PopoverExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Popover Example')),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Button(),
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
      ),
      child: GestureDetector(
        child: Image.asset(
          "assets/images/poke" "_bottom.png",
          height: 37,
          width: 37,
        ),
        onTap: () {
          showPopover(
            context: context,
            transitionDuration: const Duration(milliseconds: 150),
            bodyBuilder: (context) => const ListItems(),
            onPop: () => print('Popover was popped!'),
            direction: PopoverDirection.top,
            width: 70,
            height: 170,
            arrowHeight: 15,
            arrowWidth: 25,
          );
        },
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Container(
              margin: const EdgeInsets.all(5),
                child: Image.asset(
              "assets/images/poke_bottom.png",
              height: 37,
              width: 37,
            )),
            Container(
              margin: const EdgeInsets.all(5),
                child: Image.asset(
              "assets/images/pokeball.png",
              height: 37,
              width: 37,
            )),
            Container(
              margin: const EdgeInsets.all(5),
                child: Image.asset(
              "assets/images/ultraball.png",
              height: 37,
              width: 37,
            )),
          ],
        ),
      ),
    );
  }
}
