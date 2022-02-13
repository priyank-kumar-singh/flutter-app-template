import 'package:flutter/material.dart';

import 'body.dart';

class TnCDialog extends AlertDialog {
  TnCDialog({
    Key? key,
    required void Function() onDecline,
    required void Function() onAccept,
  }) : super(
          key: key,
          title: const Text('Terms and Conditions'),
          actions: [
            _TnCDialogActions(
              onDecline: onDecline,
              onAccept: onAccept,
              textStyle: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Please read our terms and conditions carefully, and agree to continue.',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 8.0,
              ),
              Expanded(child: TnCBody()),
            ],
          ),
        );
}

class _TnCDialogActions extends StatefulWidget {
  final void Function() onDecline;
  final void Function() onAccept;
  final TextStyle textStyle;

  const _TnCDialogActions({
    required this.onDecline,
    required this.onAccept,
    required this.textStyle,
  });

  @override
  _TnCDialogActionsState createState() => _TnCDialogActionsState();
}

class _TnCDialogActionsState extends State<_TnCDialogActions> {
  bool accepted = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Checkbox(
              value: accepted,
              onChanged: (val) {
                if (mounted) {
                  setState(() => accepted = val ?? false);
                }
              },
            ),
            const Expanded(
              child: Text('I have read and agree to the terms and conditions'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: Text(
                'Decline',
                style: widget.textStyle
              ),
              onPressed: widget.onDecline,
            ),
            TextButton(
              child: Text(
                'Accept',
                style: widget.textStyle,
              ),
              onPressed: accepted ? widget.onAccept : null,
            ),
          ],
        ),
      ],
    );
  }
}
