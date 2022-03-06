import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../constants/const.dart';
import '../../../util/util.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late ProgressDialog progressDialog;

  final image = Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 32.0,
      vertical: kAuthBtnPadding + 24.0,
    ),
    child: Image.asset(
      Assets.images.welcomePageImage,
      fit: BoxFit.fitWidth,
    ),
  );

  final divider = const Divider(
    indent: kAuthBtnPadding + 32.0,
    endIndent: kAuthBtnPadding + 32.0,
    height: 30.0,
  );

  void handleButtons(BuildContext context, String route) {
    if (route == 'google') {
      handleGoogleLogin(context, progressDialog);
    } else {
      Navigator.of(context).pushNamed(route);
    }
  }

  Future<void> handleGoogleLogin(BuildContext context, ProgressDialog pd) async {
    await FirebaseAuthService(
      onStart: () async {
        await pd.show();
      },
      onFinish: (user, claims) async {
        await pd.hide();
        if (user != null) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.dashboard, (route) => false);
        }
      },
      onError: (code, message) async {
        await pd.hide();
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text('$message')));
      },
    ).googleOAuth();
  }

  @override
  void initState() {
    super.initState();
    progressDialog = ProgressDialog(
      context,
      isDismissible: false,
      type: ProgressDialogType.normal,
      customBody: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: Row(
          children: const [
            CircularProgressIndicator(),
            SizedBox(width: 16.0),
            Text('Initialised Signing Process...'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              image,
              const SizedBox(height: 8.0),
              Text(
                context.l10n.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ThemeConstants.lightThemePrimaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                context.l10n.tagline,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16.0,
              ),
              MyElevatedButton(
                buttonText: 'Sign Up',
                onPressed: () => handleButtons(context, Routes.signup),
              ),
              MyElevatedButton(
                buttonText: 'Login',
                onPressed: () => handleButtons(context, Routes.signin),
                fillWithDark: false,
              ),
              divider,
              Builder(builder: (context) {
                return MyElevatedButton(
                  buttonText: 'Continue with Google',
                  onPressed: () => handleButtons(context, 'google'),
                );
              }),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
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
        ),
      ),
    );
  }
}
