import 'package:flutter/widgets.dart';

import '../../util/util.dart';
import '../../views/core/auth/signin.dart';
import '../../views/core/auth/signup.dart';
import '../../views/core/auth/welcome.dart';
import '../../views/core/intro/getstarted.dart';
import '../../views/core/intro/onboarding.dart';
import '../../views/core/wrapper.dart';
import '../../views/dashboard/home.dart';

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
