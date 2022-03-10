import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../constants/const.dart';

class AuthAppBar extends AppBar {
  AuthAppBar(
    BuildContext context, {
    Key? key,
  }) : super(
          key: key,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: appTheme.isDark
                  ? const Color.fromARGB(132, 167, 152, 152)
                  : const Color.fromARGB(255, 131, 126, 126),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        );
}

class AuthTextFormField extends Padding {
  AuthTextFormField({
    Key? key,
    required String hintText,
    required FormFieldSetter<String>? onSaved,
    required FormFieldValidator<String>? validator,
    TextInputType? textInputType,
    double? horizontalPadding,
    bool showText = true,
  }) : super(
          key: key,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? kAuthBtnPadding,
            vertical: 8.0,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              errorMaxLines: 3,
            ),
            onSaved: onSaved,
            validator: validator,
            keyboardType: textInputType,
            obscureText: !showText,
          ),
        );
}
