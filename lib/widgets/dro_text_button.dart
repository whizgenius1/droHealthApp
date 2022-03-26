import 'package:dro_app/utility/export_utilities.dart';
import 'package:dro_app/utility/export_widgets.dart';
import 'package:flutter/material.dart';

class DROTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const DROTextButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: DROText(
          text: text,

          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: droPurple,
        ));
  }
}
