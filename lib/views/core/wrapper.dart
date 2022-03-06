import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../util/util.dart';
import '../dashboard/home.dart';
import 'auth/welcome.dart';
import 'intro/startup_anim.dart';
import 'intro/splash.dart';

class Wrapper extends StatefulWidget {
  /// This parameter will be completely ignored if [isDev] is True
  ///
  /// In order to see a splash screen set both [isDev] and [isTestingInit] as False
  final bool showAnimatedSplashScreen;

  final bool isTestingInit;

  /// Prevents any SplashScreen or StartupAnimation and redirects directly to Dashboard
  final bool isDev;

  const Wrapper({
    Key? key,
    this.showAnimatedSplashScreen = !false,
    this.isTestingInit = false,
    this.isDev = !true,
  }) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final Completer<Widget?> completer = Completer();

  Future<Widget?> initTools() async {
    if (widget.isTestingInit) {
      await Future.delayed(const Duration(milliseconds: 1600));
      Navigator.of(context).pushReplacementNamed(Routes.welcome);
      return null;
    }

    try {
      sharedPrefs = await SharedPrefService.getInstance();
      sqflite = await SQLService.getInstance();
    } catch (_) {}

    try {
      await Firebase.initializeApp();
      if (widget.isDev) {
        return null;
      }
      if (widget.showAnimatedSplashScreen) {
        Navigator.of(context).pushReplacementNamed(
          FirebaseAuth.instance.currentUser == null
              ? Routes.welcome
              : Routes.dashboard,
        );
      } else {
        return FirebaseAuth.instance.currentUser == null
            ? const WelcomeScreen()
            : const DashboardScreen();
      }
    } catch (_) {
      //TODO: Handle Firebase Not Initialised or Let it be
      return const DashboardScreen();
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
    completer.complete(initTools());
  }

  @override
  Widget build(BuildContext context) {
    return widget.isDev
        ? const DashboardScreen()
        : widget.showAnimatedSplashScreen
            ? StartupAnimationScreen(completer.future)
            : const SplashScreen();
  }
}
