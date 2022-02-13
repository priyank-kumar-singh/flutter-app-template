import 'package:flutter/material.dart';

import '../../../config.dart';

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
