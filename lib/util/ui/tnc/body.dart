import 'package:flutter/widgets.dart';

class TnCBody extends StatelessWidget {
  final double fontSize;
  final TextStyle? textStyle;
  final TextStyle? headerStyle;

  const TnCBody({
    Key? key,
    this.textStyle,
    this.headerStyle,
    this.fontSize = 14.0,
  }) : super(key: key);

  static const lorenIpsum = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Erat nam at lectus urna duis convallis convallis tellus. Et ultrices neque ornare aenean euismod elementum nisi quis eleifend. Malesuada fames ac turpis egestas. Viverra ipsum nunc aliquet bibendum enim facilisis gravida.';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextItem(lorenIpsum),
          buildHeaderText('Our Privacy Policy'),
          buildTextItem(lorenIpsum),
          buildTextItem(lorenIpsum),
          buildTextItem(lorenIpsum),
          buildTextItem(lorenIpsum),
          buildTextItem(lorenIpsum),
          buildTextItem(lorenIpsum),
          buildTextItem(lorenIpsum),
        ],
      ),
    );
  }

  Widget buildTextItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: textStyle ?? TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }

  Widget buildHeaderText(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Text(
        text,
        style: headerStyle ?? TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
