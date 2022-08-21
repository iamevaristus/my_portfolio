import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/config/colors.dart';
import 'package:website/provider/navigation_provider.dart';
import 'package:website/routes/nav_controller.dart';

class DrawerNavItem extends StatelessWidget {
  final String route;
  final String title;
  final Icon icon;
  const DrawerNavItem({
    Key? key,
    required this.route,
    required this.title,
    required this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigationProvider>(context);
    final collapsed = provider.collapsed;
    return InkWell(
      onTap: () => locator<NavController>().navForward(route),//navController.navForward(route)
      child: collapsed
      ? Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon
        ],
      )
      : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            const SizedBox(width: 10,),
            Text(
              title,
              style: TextStyle(color: whiteColor, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}