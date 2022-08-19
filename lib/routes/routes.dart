const root = "/";

const home = "Home";
const homeRoute = "/home";

const about = "About";
const aboutRoute = "/about";

const contact = "Contact";
const contactRoute = "/contact";

const gallery = "Gallery";
const galleryRoute = "/gallery";

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