// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes.dart';

class RoundedButtonBorder extends StatelessWidget {
  RoundedButtonBorder({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.borderColor,
    required this.borderWidth,
    required this.textColor,
    required this.onPressed,
  }) : super(key: key);

  double width;
  double height;
  double borderWidth;
  String text;
  Color borderColor;
  Color textColor;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: GestureDetector(
        onTap: () => onPressed(),
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              width: borderWidth,
              color: borderColor,
            ),
          ),
          child: Text(
            text,
            style: heading1MediumTextStyle.copyWith(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
