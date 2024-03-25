import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_questions_form/routs/routing_data.dart';
import 'package:training_questions_form/routs/routs_names.dart';
import 'package:training_questions_form/screens/login/view/login_screen.dart';
import 'package:training_questions_form/screens/navigation/view/navigation_container.dart';
import 'package:training_questions_form/screens/sessions/view/sessions_screen.dart';

import '../screens/not_found_screen/not_found_screen.dart';

class AppRouter {
  static Route<dynamic> getLoginRoute(RouteSettings settings) {
    var uriData = Uri.parse(settings.name!);

    var routingData = RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );

    print('RoutingName: ${routingData.route}');
    return _getPageRoute(const LoginScreen(), settings);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var uriData = Uri.parse(settings.name!);

    var routingData = RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );

    print('RoutingName: ${routingData.route}');

    switch (routingData.route) {
      case RouteName.HOME:
        return _getPageRoute(
            const NavigationContainer(SessionScreen(), 0), settings);

      case RouteName.LOGIN:
        return _getPageRoute(const LoginScreen(), settings);

      default:
        return _getPageRoute(const NotFoundScreen(), settings);
    }
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget? child;
  final String? routeName;

  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child!,
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
