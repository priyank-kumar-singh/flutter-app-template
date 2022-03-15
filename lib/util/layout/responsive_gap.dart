import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import 'responsive_layout_builder.dart';

/// {@template responsive_gap}
/// A wrapper around [Gap] that renders a [small], [medium]
/// or a [large] gap depending on the screen size.
/// {@endtemplate}
class ResponsiveGap extends StatelessWidget {
  /// {@macro responsive_gap}
  const ResponsiveGap({
    Key? key,
    this.small,
    this.medium,
    this.large,
    this.gap = 0.0,
  }) : super(key: key);

  /// A gap rendered on a small layout.
  final double? small;

  /// A gap rendered on a medium layout.
  final double? medium;

  /// A gap rendered on a large layout.
  final double? large;

  /// A gap rendered when layout specific gap not provided
  final double gap;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (_, __) => Gap(small ?? gap),
      medium: (_, __) => Gap(medium ?? gap),
      large: (_, __) => Gap(large ?? gap),
    );
  }
}
