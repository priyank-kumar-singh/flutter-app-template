import 'package:flutter/material.dart';

import '../../../config.dart';
import '../../../constants/app.dart';
import '../../../constants/const.dart';
import '../../../utils.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({
    Key? key,
    this.backgroundImage,
    this.topImage,
    this.image,
    this.buttonText,
  }) : super(key: key);

  final bool? backgroundImage;
  final bool? topImage;
  final String? image;
  final String? buttonText;

  void handleButtons(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            Visibility(
              visible: backgroundImage ?? false,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image ?? AppInfo.logo),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Visibility(
                  visible: topImage ?? !(backgroundImage ?? false),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: kAuthBtnPadding + 24.0,
                    ),
                    child: Image.asset(
                      image ?? AppInfo.logo,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                SizedBox(height: 8.0 + (topImage ?? true ? 0.0 : 48.0)),
                const Text(
                  AppInfo.homeTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ThemeConstants.lightThemePrimaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 24.0),
                const Text(
                  AppInfo.tagline,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Expanded(child: Container()),
                MyElevatedButton(
                  buttonText: buttonText ?? 'Get Started',
                  onPressed: () => handleButtons(context, Routes.onboarding),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 32.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Read our '),
                      InteractiveText(
                        'Terms and Conditions',
                        onTap: () => handleButtons(context, Routes.tnc),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
