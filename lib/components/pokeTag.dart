import 'package:string_extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class PokeTag extends StatelessWidget {
  const PokeTag({super.key, this.text, this.color, this.textColor = ""});

  final String? text;
  final Color? color;
  final String? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 3, 10, 5),
        decoration: BoxDecoration(
          color: color ?? Colors.amber,
            border: Border.all(color: color ?? Colors.amber),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Center(
            child: Text(
          text.capitalize ?? "",
          style: TextStyle(
              color: textColor == "white" ? Colors.white : Colors.black),
        )));
  }
}
