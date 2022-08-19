import 'package:flutter/material.dart';
import 'package:website/config/colors.dart';

class Button extends StatelessWidget {
  final VoidCallback pressed;
  final Icon icon;
  final String text;
  final double width;

  const Button({
    Key? key,
    required this.pressed,
    required this.icon,
    required this.text,
    this.width = 300
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: pressed,
      icon: icon,
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.white;
            }
            return drawerColor;
          }
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1)
          )
        )
      ),
    );
  }
}