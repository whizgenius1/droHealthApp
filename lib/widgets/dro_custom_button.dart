import 'package:flutter/material.dart';

import '../utility/export_utilities.dart';

class DROCustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? width;
  final Widget child;
  const DROCustomButton(
      {Key? key, required this.onPressed, required this.child, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        child: Container(
          child: child,
          width: width ?? MediaQuery.of(context).size.width * .9,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: droPurpleGradient,
              borderRadius: BorderRadius.circular(
                10,
              ),
              //   border: Border.all(color: white, width: 2),
              boxShadow: [
                BoxShadow(
                  color: droPurpleGradientStart.withOpacity(.2),
                  blurRadius: 4,
                  spreadRadius: 1,
                  // blurStyle: BlurStyle.outer,
                  offset: const Offset(4, 6),
                ),
              ]),
        ));
  }
}
