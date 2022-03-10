import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';

class InteractiveTextItem {
  /// String to be displayed as a text
  final String text;

  /// GestureCallback which triggers in response to a tap event on the text
  ///
  /// if null this text will act as a normal text
  final GestureTapCallback? onTap;

  /// This [style] property will override [style] and [interactiveTextStyle]
  /// properties of Interactive Text
  final TextStyle? style;

  InteractiveTextItem(
    this.text, {
    this.onTap,
    this.style,
  });
}

class InteractiveText extends RichText {
  InteractiveText({
    required List<InteractiveTextItem> text,
    Key? key,
    TextStyle? style,
    TextStyle? interactiveTextStyle,
    bool softWrap = true,
    double textScaleFactor = 1.0,
    int? maxLines,
    StrutStyle? strutStyle,
    TextAlign textAlign = TextAlign.start,
    TextDirection? textDirection,
    TextHeightBehavior? textHeightBehavior,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextWidthBasis textWidthBasis = TextWidthBasis.parent,
    FontWeight? fontWeight = FontWeight.bold,
    Color? textColor,
  }) : super(
          key: key,
          text: TextSpan(
            children: text.map((e) {
              final isInteractive = e.onTap != null;
              return TextSpan(
                text: e.text,
                recognizer: TapGestureRecognizer()..onTap = e.onTap,
                mouseCursor: isInteractive ? SystemMouseCursors.click : null,
                style: e.style ??
                    (isInteractive
                        ? interactiveTextStyle ??
                            TextStyle(color: textColor, fontWeight: fontWeight)
                        : style ?? appTheme.theme.textTheme.bodyText2),
              );
            }).toList(),
          ),
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
        );
}
