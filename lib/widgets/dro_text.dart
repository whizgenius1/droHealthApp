import 'package:flutter/material.dart';

import '../utility/export_utilities.dart';

class DROText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  const DROText(
      {Key? key,
      required this.text,
      this.color = categoryTextColor,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w400,
      this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'ProximaNova',
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
