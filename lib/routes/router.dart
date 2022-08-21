import 'package:flutter/material.dart';
import 'package:website/pages/screens/about_page.dart';
import 'package:website/pages/screens/contact_page.dart';
import 'package:website/pages/screens/gallery_page.dart';
import 'package:website/pages/screens/home_page.dart';
import 'package:website/pages/screens/page_not_found.dart';
import 'package:website/routes/routes.dart';

Route generateRoute(RouteSettings settings){
  switch (settings.name) {
    case homeRoute:
      return FadeRoute(child: const HomePage(), routeName: homeRoute);
    case aboutRoute:
      return FadeRoute(child: const AboutPage(), routeName: aboutRoute);
    case contactRoute:
      return newRoute(const ContactPage(), contactRoute);
    case galleryRoute:
      return newRoute(const GalleryPage(), galleryRoute);
    default:
    return newRoute(const PageNotFound(), homeRoute);
  }
}

  PageRoute newRoute(Widget widget, String settings){
    return MaterialPageRoute(builder: (context){
      return widget;
    }, settings: RouteSettings(name: settings));
  }

class FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  FadeRoute({required this.child, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}