import 'package:flutter/widgets.dart';

// These files get generate upon running flutter pub get command
// still seeing linter errors? restart dart analysis server
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
