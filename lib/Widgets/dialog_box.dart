import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/themes.dart';

class DialogBox extends StatelessWidget {
  DialogBox({
    Key? key,
    required this.widget,
    required this.height,
  }) : super(key: key);
  Widget widget;
  double height;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        height: height,
        child: widget,
      ),
    );
  }
}
