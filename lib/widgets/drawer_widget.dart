import 'package:flutter/material.dart';
import 'package:website/config/colors.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final collapsed = false;
    return Drawer(
      child: Container(
        color: drawerColor,
      ),
    );
  }
}