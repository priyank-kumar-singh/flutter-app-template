part of 'anim.dart';

class _ExplosionPainter extends CustomPainter {
  _ExplosionPainter({
    required this.color,
    required this.holeSize,
    required this.rings,
  });

  final Color color;
  final double rings;
  final double holeSize;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = holeSize / 2;
    final center = Offset(size.width / 2, size.height / 2);

    Path hole1 = Path.combine(
      PathOperation.difference,
      Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
      Path()
        ..addOval(Rect.fromCircle(center: center, radius: radius))
        ..close(),
    );
    canvas.drawPath(hole1, Paint()..color = color);

    for (int i = 1; i < rings; ++i) {
      final hole = Path.combine(
        PathOperation.difference,
        Path()
          ..addOval(Rect.fromCircle(center: center, radius: radius / i))
          ..close(),
        Path()
          ..addOval(Rect.fromCircle(center: center, radius: radius / (i+1)))
          ..close(),
      );
      canvas.drawPath(hole, Paint()..color = color.withOpacity(1 - 0.2 * i));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
