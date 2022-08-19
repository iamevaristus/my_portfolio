import 'package:flutter/material.dart';
import 'package:website/pages/screens/about_page.dart';
import 'package:website/pages/screens/contact_page.dart';
import 'package:website/pages/screens/gallery_page.dart';
import 'package:website/pages/screens/home_page.dart';
import 'package:website/routes/routes.dart';

Route generateRoute(RouteSettings settings){
  switch (settings.name) {
    case home:
      return getRoute(const HomePage());
    case about:
      return getRoute(const AboutPage());
    case contact:
      return getRoute(const ContactPage());
    case gallery:
      return getRoute(const GalleryPage());
    default:
    return getRoute(const HomePage());
  }
}

PageRoute getRoute(Widget child){
    return MaterialPageRoute(builder: (context) => child);
  }