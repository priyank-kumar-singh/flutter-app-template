import 'package:flutter/material.dart';

import '../../../constants/app.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  final productLogoSize = 80.0;
  final brandLogoSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Image.asset(
              AppInfo.logo,
              height: productLogoSize,
              width: productLogoSize,
              fit: BoxFit.fitWidth,
            ),
            Column(
              children: [
                const Text(
                  'from',
                ),
                const SizedBox(height: 6.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppInfo.brandLogo,
                      height: brandLogoSize,
                      width: brandLogoSize,
                    ),
                    const SizedBox(width: 8.0),
                    const Text(AppInfo.organization),
                  ],
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
