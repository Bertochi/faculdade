import 'package:flutter/material.dart';

class BtnIconGeneric extends StatelessWidget {
  const BtnIconGeneric(
      {Key? key,
        this.onPressed,
        required this.icon,
        required this.text,
        this.color,
        this.minimumSize,
      })
      : super(key: key);
  final VoidCallback? onPressed;
  final Icon icon;
  final Text text;
  final Color? color;
  final Size? minimumSize;

  @override
  Widget build(BuildContext context) {
    if (onPressed == null) {
      return ElevatedButton.icon(
        onPressed: () {},
        icon: icon,
        label: text,
        style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 185, 185, 185),
            minimumSize: minimumSize,
            textStyle: const TextStyle(fontSize: 18)
        ), //minimumSize: Size.fromHeight(40)
      );
    } else {
      return ElevatedButton.icon(
        onPressed: () {
          onPressed!();
        },
        icon: icon,
        label: text,
        style: ElevatedButton.styleFrom(
            primary: color,
            minimumSize: minimumSize,
            textStyle: const TextStyle(fontSize: 18)
        ), //minimumSize: Size.fromHeight(40)
      );
    }
  }
}
