import 'dart:io';

import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../constants/const.dart';
import '../../util/util.dart';
import '../../widgets/widgets.dart';
import '../components/core.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  late ProgressDialog progressDialog;
  String? email, password, error;

  void saveForm() {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    FocusScope.of(context).unfocus();
    handleEmailPasswordAuth();
  }

  Future<void> handleEmailPasswordAuth() async {
    var service = FirebaseAuthService(
      onStart: () async {
        if (mounted) {
          setState(() => error = null);
          await progressDialog.show();
        }
      },
      onFinish: (user, data) async {
        await progressDialog.hide();
        // TODO: onFinish SigningIn
      },
      onError: (code, message) async {
        if (mounted) {
          await progressDialog.hide();
          setState(() => error = message);
        }
      },
    );
    await service.loginUser(email: email!, password: password!);
  }

  void handleForgotPassword() {
    //TODO: Forgot Password
  }

  void handleButton() {
    Navigator.of(context).pushReplacementNamed(Routes.signup);
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
            Text('Logging In...'),
          ],
        ),
      ),
    );
  }

  final image = Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 32.0,
      vertical: 64.0,
    ),
    child: Image.asset(
      Assets.images.loginPageImage,
      fit: BoxFit.fitWidth,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: Platform.isAndroid || Platform.isIOS ? null : AuthAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                image,
                AuthTextFormField(
                  hintText: 'Email',
                  onSaved: (val) => email = val,
                  textInputType: TextInputType.emailAddress,
                  validator: ValidationHelper.email,
                ),
                AuthTextFormField(
                  hintText: 'Password',
                  onSaved: (val) => password = val,
                  validator: ValidationHelper.password,
                  textInputType: TextInputType.visiblePassword,
                  showText: false,
                ),
                Visibility(
                  visible: error != null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kAuthBtnPadding,
                      vertical: 8.0,
                    ),
                    child: Text(
                      '$error',
                      style: TextStyle(
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  ),
                  replacement: const SizedBox(height: 16.0),
                ),
                MyElevatedButton(
                  buttonText: 'Login',
                  onPressed: saveForm,
                ),
                const SizedBox(height: 24.0),
                InteractiveText(
                  text: [
                    InteractiveTextItem('Don\'t have an account? '),
                    InteractiveTextItem(
                      'Sign Up',
                      onTap: handleButton,
                    ),
                  ],
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                const SizedBox(height: 8.0),
                InteractiveText(
                  text: [
                    InteractiveTextItem(
                      'Forgot Password?',
                      onTap: handleForgotPassword,
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
