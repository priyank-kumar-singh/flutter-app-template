import 'package:flutter/material.dart';
import '../../../utils.dart';

class StartupAnimationScreen extends StatelessWidget {
  const StartupAnimationScreen(
    this.future, {
    Key? key,
  }) : super(key: key);

  final Future<Widget?> future;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            FutureBuilder<Widget?>(
              future: future,
              builder: (_, snapshot) => snapshot.data ?? Container(),
            ),
            const IgnorePointer(
              child: StartupRainDropAnimation(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
