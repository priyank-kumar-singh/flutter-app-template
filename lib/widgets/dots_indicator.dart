import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

/// This widget useful when you're using pageView
class MyDotsIndicator extends StatefulWidget {
  const MyDotsIndicator({
    Key? key,
    required this.controller,
    required this.count,
    this.duration = 300,
  }) : super(key: key);

  final PageController controller;
  final int count;
  final int duration;

  @override
  State<MyDotsIndicator> createState() => _MyDotsIndicatorState();
}

class _MyDotsIndicatorState extends State<MyDotsIndicator> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        return DotsIndicator(
          decorator: DotsDecorator(
            activeColor: Theme.of(context).colorScheme.secondary,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            activeSize: const Size(20.0, 10.0),
            color: Colors.black26,
            size: const Size.square(10.0),
            spacing: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          dotsCount: widget.count,
          onTap: (value) {
            widget.controller.animateToPage(
              value.toInt(),
              duration: Duration(milliseconds: widget.duration),
              curve: Curves.easeIn,
            );
          },
          position: widget.controller.page == null ? 0.0 : widget.controller.page!,
        );
      },
    );
  }
}
