import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:website/routes/router.dart';
import 'package:website/routes/routes.dart';

class NavController extends GetxController{
  static NavController instance = Get.find();
  final GlobalKey<NavigatorState> navKey = GlobalKey();

  Future<dynamic> navForward(String route){
    return navKey.currentState!.pushNamed(route);
  }

  back() => navKey.currentState!.pop();
}

NavController navController = NavController.instance;

Navigator localNav() => Navigator(
  key: locator<NavController>().navKey,//locator<NavController>().navKey,navController.navKey,
  onGenerateRoute: generateRoute,
  initialRoute: homeRoute,
);

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavController());
}