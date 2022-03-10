import 'package:flutter/material.dart';

import '../../core/core.dart';

abstract class RouteHandler {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return routeBuilder(const PageNotFoundScreen());
    }
  }

  static MaterialPageRoute routeBuilder(Widget route) {
    return MaterialPageRoute(builder: (_) => route);
  }
}
