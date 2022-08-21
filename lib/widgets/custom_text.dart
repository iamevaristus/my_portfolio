import 'package:flutter/material.dart';

class WebTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  final TextAlign align;
  const WebTextWidget({
    Key? key,
    required this.text,
    this.color = Colors.white,
    this.size = 14,
    this.weight = FontWeight.normal,
    this.align = TextAlign.left
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight
      ),
      textAlign: align,
    );
  }
}