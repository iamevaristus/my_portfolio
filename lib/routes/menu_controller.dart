import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:website/config/colors.dart';
import 'package:website/routes/nav_controller.dart';
import 'package:website/routes/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = homeRoute.obs;

  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case homeRoute:
        return _customIcon(Icons.grid_view_sharp, itemName);
      case aboutRoute:
        return _customIcon(Icons.grid_view_sharp, itemName);
      case contactRoute:
        return _customIcon(Icons.grid_view_sharp, itemName);
      case galleryRoute:
        return _customIcon(Icons.grid_view_sharp, itemName);
      default:
        return _customIcon(Icons.grid_view_sharp, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 24, color: whiteColor,);

    return Icon(
      icon,
      color: isHovering(itemName) ? blackColor : mainColor,
    );
  }
}

MenuController menuController = MenuController.instance;

class VertticalMenuItem extends StatelessWidget {
  final String itemName;
  final Function() onTap;
  const VertticalMenuItem({Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
        onTap: onTap,
        onHover: (value) {
          value
              ? menuController.onHover(itemName)
              : menuController.onHover("not hovering");
        },
        child: Obx(() => Container(
              color: menuController.isHovering(itemName)
                  ? blackColor.withOpacity(.1)
                  : Colors.transparent,
              child: Row(
                children: [
                  Visibility(
                    visible: menuController.isHovering(itemName) ||
                        menuController.isActive(itemName),
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Container(
                      width: 3,
                      height: 72,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: menuController.returnIconFor(itemName),
                        ),
                        if (!menuController.isActive(itemName))
                          Flexible(
                              child: CustomText(
                            text: itemName,
                            color: menuController.isHovering(itemName)
                                ? Colors.white
                                : blackColor,
                          ))
                        else
                          Flexible(
                              child: CustomText(
                            text: itemName,
                            color: Colors.white,
                            size: 18,
                            weight: FontWeight.bold,
                          ))
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;

  const CustomText({Key? key, required this.text, this.size = 16, required this.color, this.weight = FontWeight.normal}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: TextStyle(fontSize: size, color: color, fontWeight: weight),
    );
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
                color: drawerColor,
                child: ListView(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            SizedBox(width: _width / 48),
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Image.asset("assets/icons/logo.png"),
                            ),
                            Flexible(
                              child: CustomText(
                                text: "Dash",
                                size: 20,
                                weight: FontWeight.bold,
                                color: whiteColor,
                              ),
                            ),
                            SizedBox(width: _width / 48),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                        Divider(color: blackColor.withOpacity(.1), ),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: routeMenu
                          .map((item) => SideMenuItem(
                              itemName: item.name,
                              onTap: () => navController.navForward(item.route),
                              ))
                          .toList(),
                    )
                  ],
                ),
              ),
      ],
    );
  }
}

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final Function() onTap;

  const SideMenuItem({ Key? key, required this.itemName, required this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VertticalMenuItem(itemName: itemName, onTap: onTap,);
  }
}