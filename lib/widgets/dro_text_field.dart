import 'package:dro_app/utility/export_utilities.dart';
import 'package:flutter/material.dart';

class DROTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final bool enablePaste;
  final bool autoFocus;
  const DROTextField(
      {Key? key,
      required this.controller,
      this.onChanged,
      this.keyboardType,
      this.focusNode,
        this.autoFocus = false,
      this.enablePaste = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: MediaQuery.of(context).size.width * .7,
        height: 45,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: white.withOpacity(.4),
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus:autoFocus ,
          enableInteractiveSelection: enablePaste,
          onChanged: onChanged,
          keyboardType: keyboardType,
          textAlign: TextAlign.left,
          cursorColor: white,
          style: TextStyle(color: white),
          decoration: InputDecoration(
              hintText: "Search Products",
              hintStyle: TextStyle(color: categoryTextColor.withOpacity(.5)),
              iconColor: white,
              focusColor: droPurple),
        ),
      ),
    );
  }
}
