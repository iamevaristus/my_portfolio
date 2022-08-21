import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/config/icons.dart';
import 'package:website/provider/navigation_provider.dart';

class DrawerCollapseIcon extends StatelessWidget {
  final bool collapsed;
  final BuildContext context;
  const DrawerCollapseIcon({
    Key? key,
    required this.collapsed,
    required this.context
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double size = 42;
    final icon = collapsed ? forward : backward;
    final align = collapsed ? Alignment.center : Alignment.centerRight;
    final margin = collapsed ? null : const EdgeInsets.only(right: 10);
    final width = collapsed ? double.infinity : size;
    return Container(
      alignment: align,
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            final provider =
              Provider.of<NavigationProvider>(context, listen: false);
            provider.toggleCollapsed();
          },
          child: SizedBox(
            width: width,
            height: size,
            child: icon,
          ),
        ),
      ),
    );
  }
}