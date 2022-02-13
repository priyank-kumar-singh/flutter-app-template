import 'package:flutter/material.dart';

class FABBack extends FloatingActionButton {
  FABBack({
    Key? key,
    required BuildContext context,
    VoidCallback? onPressed,
  }) : super(
          key: key,
          onPressed: onPressed ?? () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back),
        );

  FABBack.extended({
    Key? key,
    required BuildContext context,
    VoidCallback? onPressed,
    String label = 'Back',
  }) : super.extended(
          key: key,
          onPressed: onPressed ?? () => Navigator.of(context).pop(),
          label: Text(label),
          icon: const Icon(Icons.arrow_back),
        );
}
