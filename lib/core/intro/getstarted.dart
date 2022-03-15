import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../constants/const.dart';
import '../../widgets/widgets.dart';

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
                    image: AssetImage(image ?? Assets.images.logo),
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
                      image ?? Assets.images.logo,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                SizedBox(height: 8.0 + (topImage ?? true ? 0.0 : 48.0)),
                Text(
                  context.l10n.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: appTheme.theme.primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 24.0),
                Text(
                  context.l10n.tagline,
                  style: const TextStyle(
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
                  child: InteractiveText(
                    context: context,
                    text: [
                      InteractiveTextItem('Read our '),
                      InteractiveTextItem(
                        'Terms and Conditions',
                        onTap: () => handleButtons(context, Routes.tnc),
                      ),
                    ],
                    textAlign: TextAlign.center,
                    maxLines: 2,
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
