import "package:flutter_viper_arch_demo/view/view_library.dart";
import "package:flutter/material.dart";

class NavigateGraph {
  static final _instance = NavigateGraph._singleInstance();
  factory NavigateGraph() => _instance;
  NavigateGraph._singleInstance();

  static const String lobby = "lobby";
  static const String home = "home";

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case lobby:
        return MaterialPageRoute(builder: (context) => const Lobby());
      case home:
        return MaterialPageRoute(builder: (context) => const Home());
      default:
        return MaterialPageRoute(builder: (context) => const Lobby());
    }
  }

  static void moveTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  static void changeTo(BuildContext context, String routeName) {
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
  }
}
