import 'package:flutter/material.dart';

void showConfirmDialog({
  required BuildContext context,
  String? acceptButtonText,
  String? declineButtonText,
  required VoidCallback onAccept,
  VoidCallback? onDecline,
  String? title,
  String? content,
  Widget? child,
  bool showCancelButton = true,
  TextStyle? titleTextStyle,
  TextStyle? contentTextStyle,
  TextStyle? actionTextStyle,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    useSafeArea: true,
    builder: (context) {
      return AlertDialog(
        title: title != null ? Text(title, style: titleTextStyle) : null,
        content: child ?? (content != null ? Text(content, style: contentTextStyle) : null),
        actions: [
          Visibility(
            visible: showCancelButton,
            child: TextButton(
              onPressed: onDecline ?? () => Navigator.of(context).pop(),
              child: Text(declineButtonText ?? 'Cancel', style: actionTextStyle),
            ),
          ),
          TextButton(
            onPressed: onAccept,
            child: Text(acceptButtonText ?? 'Confirm', style: actionTextStyle),
          ),
        ],
      );
    },
  );
}
