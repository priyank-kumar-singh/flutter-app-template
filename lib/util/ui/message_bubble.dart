import 'package:flutter/widgets.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(
    this.text, {
    Key? key,
    this.ltr = true,
    this.fillColor = const Color.fromARGB(255, 245, 237, 170),
    this.textStyle,
    this.fontSize,
    this.margin,
    this.padding,
  }) : assert(fontSize == null || textStyle == null),
    super(key: key);

  final String text;
  final bool ltr;
  final Color fillColor;
  final TextStyle? textStyle;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BubblePainter(fillColor, ltr),
      child: Container(
        child: Text(
          text,
          style: textStyle ?? TextStyle(
            fontSize: fontSize,
          ),
        ),
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        ),
        padding: padding ?? const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        margin: margin,
      ),
    );
  }
}

class _BubblePainter extends CustomPainter {
  final Color color;
  final bool ltr;

  _BubblePainter(this.color, this.ltr);

  static const dx = 14.0;
  static const dy = dx / 1.2;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    final height = size.height;
    final width = size.width;

    if (ltr) {
      path
        ..moveTo(-dx, height + dy)
        ..quadraticBezierTo(-dx/4, (height + dx/2), 1, height - dx)
        ..lineTo(dx / 2, height)
        ..quadraticBezierTo(-dx/4, (height + dx/1.8), -dx, height + dy);
    } else {
      path
        ..moveTo(width + dx, height + dy)
        ..quadraticBezierTo(width + dx/4, (height + dx/2), width - 1, height - dx)
        ..lineTo(width - dx/2, height)
        ..quadraticBezierTo(width + dx/4, (height + dx/1.8), width + dx, height + dy);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
