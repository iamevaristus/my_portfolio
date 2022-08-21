import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:website/pages/layout.dart';
import 'package:website/pages/screens/page_not_found.dart';
import 'package:website/provider/providers.dart';
import 'package:website/routes/nav_controller.dart';
import 'package:website/routes/routes.dart';

void main() {
  setupLocator();
  Get.put(NavController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: GetMaterialApp(
        initialRoute: homeRoute,
        unknownRoute: GetPage(name: '/not-found', page: () => PageNotFound(), transition: Transition.fadeIn),
        getPages: [
        GetPage(name: root, page: () {
          return WebDeviceLayout();
        }),
      ],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}