import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.buttonColor,
    required this.textColor,
    required this.onPressed,
  }) : super(key: key);

  double width;
  double height;
  String text;
  Color buttonColor;
  Color textColor;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
        onPressed: () => onPressed(),
        child: Text(
          text,
          style: heading1MediumTextStyle.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
