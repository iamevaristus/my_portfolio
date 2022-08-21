import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/config/colors.dart';
import 'package:website/data/media_data.dart';
import 'package:website/provider/navigation_provider.dart';
import 'package:website/res/responsive.dart';
import 'package:website/routes/routes.dart';
import 'package:website/widgets/drawer/widgets/collapse_icon.dart';
import 'package:website/widgets/drawer/widgets/drawer_nav.dart';
import 'package:website/widgets/drawer/widgets/footer.dart';
import 'package:website/widgets/drawer/widgets/header.dart';

class PortfolioDrawer extends StatefulWidget {
  const PortfolioDrawer({Key? key}) : super(key: key);

  @override
  State<PortfolioDrawer> createState() => _PortfolioDrawerState();
}

class _PortfolioDrawerState extends State<PortfolioDrawer> {
  final padding = const EdgeInsets.symmetric(horizontal: 2);
  late List<RouteMenu> route;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigationProvider>(context);
    final collapsed = provider.collapsed;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: collapsed ? 70 : 150,
      decoration: BoxDecoration(color: drawerColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10,),
          DrawHeader(collapsed: collapsed, media: mediaData),
          ResponsiveWidget.isDesktop(context)
            ? const SizedBox(height: 30,)
            : const SizedBox(height: 10,),
            const DrawerNavigator(),
          // drawerList(items: drawerData, collapsed: collapsed),
          ResponsiveWidget.isDesktop(context)
            ? const SizedBox(height: 30,)
            : const SizedBox(height: 5,),
          const Divider(color: Colors.white),
          const SizedBox(height: 10,),
          DrawFooter(collapsed: collapsed, media: mediaData),
          const Spacer(),
          DrawerCollapseIcon(collapsed: collapsed, context: context)
        ],
      ),
    );
  }

  // drawerList({
  //   required bool collapsed,
  //   required List<DrawerModel> items,
  // }) {
  //   final routes = route;
  //   const padded = EdgeInsets.symmetric(horizontal: 5);
  //   return ListView.separated(
  //     padding: collapsed ? padded : padding,
  //     shrinkWrap: true,
  //     primary: false,
  //     itemCount: items.length,
  //     separatorBuilder: (context, index) =>
  //       ResponsiveWidget.isDesktop(context)
  //         ? const SizedBox(height: 5,)
  //         : const SizedBox(height: 1,),
  //     itemBuilder: (context, index) {
  //       final item = items[index];
  //       return menuItem(
  //         collapsed: collapsed,
  //         text: item.title,
  //         icon: item.icon,
  //         click: () => navController.navForward(routes.)
  //       );
  //     }
  //   );
  // }

  // void selectPage(
  //   BuildContext context,
  //   int index,
  //   List<RouteMenu> route
  //   ){
  //     final routes = route[index];
  //   switch (index) {
  //     case 0:
  //       navController.navForward(routes.route);
  //       break;
  //     case 1:
  //       navController.navForward(routes.route);
  //       break;
  //     case 2:
  //       navController.navForward(routes.route);
  //       break;
  //     case 3:
  //       navController.navForward(routes.route);
  //       break;
  //     default:
  //     navController.navForward(routes.route);
  //   }
  // }

  // menuItem({
  //   required bool collapsed,
  //   required String text,
  //   required Icon icon,
  // }) {
  //   const color = Colors.white;

  //   return Material(
  //     color: Colors.transparent,
  //     child: Column(
  //       children: routeMenu.map((routes) =>
  //         collapsed ? ListTile(
  //         leading: icon,
  //         onTap: navController.navForward(routes.route),
  //       ) : ListTile(
  //         leading: icon,
  //         title: Text(text,
  //         style: const TextStyle(color: color, fontSize: 14)),
  //         onTap: navController.navForward(routes.route),
  //       ),
  //     ).toList(),
  //     )
  //   );
  // }
}
