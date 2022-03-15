import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../modules/modules.dart';
import '../../util/util.dart';

part 'route_config.dart';
part 'route_handler.dart';

abstract class Routes {
  static const root = '/';
  static const from404 = '/home';

  static const welcome = '/welcome';
  static const signup = '/signup';
  static const signin = '/signin';

  static const tnc = '/tnc';
  static const getstarted = '/getstarted';
  static const onboarding = '/getstarted/guide';

  static const dashboard = '/home';
}
