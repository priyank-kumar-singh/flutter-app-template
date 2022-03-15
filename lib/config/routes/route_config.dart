part of 'routes.dart';

abstract class RouteConfig {
  static final routes = <String, Widget Function(BuildContext)>{
    Routes.root: (_) => const Wrapper(),

    Routes.tnc: (_) => const TnCScreen(),
    Routes.getstarted: (_) => const GetStartedScreen(),
    Routes.onboarding: (_) => const OnBoardingScreen(),

    Routes.welcome: (_) => const WelcomeScreen(),
    Routes.signin: (_) => const SigninScreen(),
    Routes.signup: (_) => const SignupScreen(),

    Routes.dashboard: (_) => const DashboardScreen(),
  };
}
