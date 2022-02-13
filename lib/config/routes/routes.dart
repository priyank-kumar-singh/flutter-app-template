import 'package:flutter/widgets.dart';

import '../../util/ui/tnc/activity.dart';
import '../../views/core/404.dart';
import '../../views/core/auth/signin.dart';
import '../../views/core/auth/signup.dart';
import '../../views/core/auth/welcome.dart';
import '../../views/core/intro/getstarted.dart';
import '../../views/core/intro/onboarding.dart';
import '../../views/core/wrapper.dart';
import '../../views/dashboard/home.dart';

class Routes {
  Routes._();

  // core
  static const wrapper = '/';
  static const tnc = '/tnc';
  static const pagenotfound = '/pagenotfound';

  //authentication
  static const welcome = '/welcome';
  static const signup = '/signup';
  static const signin = '/signin';

  static const getstarted = '/getstarted';
  static const onboarding = '/getstarted/guide';

  static const dashboard = '/home';

  static final Map<String, Widget Function(BuildContext)> routes = {
    wrapper: (_) => const Wrapper(),
    tnc: (_) => const TnCScreen(),
    pagenotfound: (_) => const PageNotFoundScreen(),

    getstarted: (_) => const GetStartedScreen(),
    onboarding: (_) => const OnBoardingScreen(),

    welcome: (_) => const WelcomeScreen(),
    signin: (_) => const SigninScreen(),
    signup: (_) => const SignupScreen(),

    // welcome2: (_) => const WelcomeScreen2(),
    dashboard: (_) => const DashboardScreen(),
  };
}
