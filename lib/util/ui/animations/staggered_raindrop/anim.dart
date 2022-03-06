import 'package:flutter/widgets.dart';

part 'painter.dart';
part 'raindrop_anim.dart';

class StartupRainDropAnimation extends StatefulWidget {
  const StartupRainDropAnimation({
    Key? key,
    required this.color,
    this.duration = 3000,
  }) : super(key: key);

  final Color color;
  final int duration;

  @override
  _StartupRainDropAnimationState createState() => _StartupRainDropAnimationState();
}

class _StartupRainDropAnimationState extends State<StartupRainDropAnimation>
    with SingleTickerProviderStateMixin {
  Size size = Size.zero;
  late final AnimationController _controller;
  late final _StaggeredRaindropAnimation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.duration),
      vsync: this,
    );
    _animation = _StaggeredRaindropAnimation(_controller);
    _controller
      ..forward()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void didChangeDependencies() {
    setState(() {
      size = MediaQuery.of(context).size;
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _HolePainter(
              color: widget.color,
              holeSize: _animation.holeSize.value * size.width,
            ),
          ),
        ),
        Positioned(
          top: _animation.dropPosition.value * size.height,
          left: size.width / 2 - _animation.dropSize.value / 2,
          child: SizedBox(
            width: _animation.dropSize.value,
            height: _animation.dropSize.value,
            child: CustomPaint(
              painter: _DropPainter(
                visible: _animation.dropVisible.value,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Opacity(
              opacity: _animation.textOpacity.value,
              child: const Text(
                'Product or Brand Tagline',
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 32),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
