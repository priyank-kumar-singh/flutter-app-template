part of 'anim.dart';

class _StaggeredRaindropAnimation {
  _StaggeredRaindropAnimation(this.controller):
        dropSize = Tween<double>(begin: 0, end: maximumDropSize).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.2, curve: Curves.easeIn),
          ),
        ),

        dropPosition = Tween<double>(begin: 0, end: maximumRelativeDropY).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.5, curve: Curves.easeIn),
          ),
        ),

        holeSize = Tween<double>(begin: 0, end: maximumHoleSize).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
          ),
        ),

        dropVisible = Tween<bool>(begin: true, end: false).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 0.5),
          ),
        ),

        textOpacity = Tween<double>(begin: 1, end: 0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 0.7, curve: Curves.easeOut),
          ),
        );

  final AnimationController controller;

  final Animation<double> dropSize;
  final Animation<double> dropPosition;
  final Animation<bool> dropVisible;
  final Animation<double> holeSize;
  final Animation<double> textOpacity;

  static const double maximumDropSize = 20;
  static const double maximumRelativeDropY = 0.5;
  static const double maximumHoleSize = 10;
}
