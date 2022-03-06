import 'package:flutter/material.dart';

import 'config/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    appTheme = AppTheme()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => context.l10n.title,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: Routes.wrapper,
      onGenerateRoute: RouteHandler.generateRoute,
      routes: RouteConfig.routes,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: appTheme.themeMode,
    );
  }
}
