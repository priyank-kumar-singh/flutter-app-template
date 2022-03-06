import 'package:flutter/widgets.dart';

part 'painter.dart';

class ExplodeAnimation extends StatefulWidget {
  const ExplodeAnimation({
    Key? key,
    required this.child,
    required this.color,
    required this.triggerAnimation,
    this.repeatOnUpdate = false,
    this.rings = 5,
    this.duration = 3000,
  }) : super(key: key);

  final Widget child;
  final Color color;
  final int duration;
  final double rings;
  final bool repeatOnUpdate;
  final bool triggerAnimation;

  @override
  _ExplodeAnimationState createState() => _ExplodeAnimationState();
}

class _ExplodeAnimationState extends State<ExplodeAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> holeAnimation;
  late final Animation<double> childAnimation;

  final maximumHoleSize = 10.0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: widget.duration),
      vsync: this,
    );
    holeAnimation = Tween<double>(begin: 0, end: maximumHoleSize).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );
    childAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInCubic),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant ExplodeAnimation oldWidget) {
    if (widget.triggerAnimation && widget.repeatOnUpdate) {
      controller
        ..reset()
        ..forward();
    } else if (!oldWidget.triggerAnimation && widget.triggerAnimation) {
      controller.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return AnimatedBuilder(
        animation: controller,
        builder: ((_, child) {
          return Stack(
            children: [
              Visibility(
                child: Opacity(
                  opacity: childAnimation.value,
                  child: child!
                ),
              ),
              Center(
                child: CustomPaint(
                  painter: _ExplosionPainter(
                    rings: widget.rings,
                    color: widget.color,
                    holeSize: holeAnimation.value * constraints.maxWidth,
                  ),
                ),
              ),
            ],
          );
        }),
        child: widget.child,
      );
    });
  }
}
