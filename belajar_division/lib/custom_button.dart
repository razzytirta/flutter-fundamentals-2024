import 'package:belajar_division/style/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:division/division.dart';

class CustomButton extends StatefulWidget {
  final ParentStyle buttonStyle;

  CustomButton(this.buttonStyle);
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isTapDown = false;
  @override
  Widget build(BuildContext context) {
    return Parent(
      child: Container(
        child: Txt(
          "division",
          style: CustomStyles.txtStyle,
        ),
      ),
      style: widget.buttonStyle.clone()
        ..scale((isTapDown) ? 1.1 : 1)
        ..elevation((isTapDown) ? 0 : 5),
      gesture: Gestures()
        ..onTapDown((details) {
          setState(() {
            isTapDown = true;
          });
        })
        ..onTapUp((details) {
          setState(() {
            isTapDown = false;
          });
        })
        ..onTapCancel(() {
          isTapDown = true;
        }),
    );
  }
}
