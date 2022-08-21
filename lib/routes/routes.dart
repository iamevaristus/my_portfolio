const String root = "/";

const home = "Home";
const String homeRoute = "/home";

const about = "About";
const String aboutRoute = "/about";

const contact = "Contact";
const String contactRoute = "/contact";

const gallery = "Gallery";
const String galleryRoute = "/gallery";

class RouteMenu{
  final String name;
  final String route;

  RouteMenu({required this.name, required this.route});
}
List<RouteMenu> routeMenu = [
  RouteMenu(name: home, route: homeRoute),
  RouteMenu(name: about, route: aboutRoute),
  RouteMenu(name: contact, route: contactRoute),
  RouteMenu(name: gallery, route: galleryRoute),
];