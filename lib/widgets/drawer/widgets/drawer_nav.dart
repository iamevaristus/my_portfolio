import 'package:flutter/material.dart';
import 'package:website/config/icons.dart';
import 'package:website/res/responsive.dart';
import 'package:website/routes/routes.dart';
import 'package:website/widgets/drawer/widgets/drawer_nav_item.dart';

class DrawerNavigator extends StatelessWidget {
  const DrawerNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerNavItem(route: homeRoute, title: "Home", icon: homeIcon),
        ResponsiveWidget.isDesktop(context) ? const SizedBox(height: 20,) : const SizedBox(height: 10,),
        DrawerNavItem(route: aboutRoute, title: "About", icon: aboutIcon),
        ResponsiveWidget.isDesktop(context) ? const SizedBox(height: 20,) : const SizedBox(height: 10,),
        DrawerNavItem(route: contactRoute, title: "Contact", icon: contactIcon),
        ResponsiveWidget.isDesktop(context) ? const SizedBox(height: 20,) : const SizedBox(height: 10,),
        DrawerNavItem(route: galleryRoute, title: "Gallery", icon: galleryIcon)
      ],
    );
  }
}