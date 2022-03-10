import 'package:flutter/widgets.dart';

import '../../core/core.dart';
import '../../modules/modules.dart';
import '../../util/util.dart';

import 'routes.dart';

abstract class RouteConfig {
  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.wrapper: (_) => const Wrapper(),
    Routes.tnc: (_) => const TnCScreen(),
    Routes.getstarted: (_) => const GetStartedScreen(),
    Routes.onboarding: (_) => const OnBoardingScreen(),
    Routes.welcome: (_) => const WelcomeScreen(),
    Routes.signin: (_) => const SigninScreen(),
    Routes.signup: (_) => const SignupScreen(),
    Routes.dashboard: (_) => const DashboardScreen(),
  };
}
