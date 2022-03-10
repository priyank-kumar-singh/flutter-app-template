import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../constants/const.dart';

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
              Assets.images.logo,
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
                      Assets.images.brandLogo,
                      height: brandLogoSize,
                      width: brandLogoSize,
                    ),
                    const SizedBox(width: 8.0),
                    Text(context.l10n.company),
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
