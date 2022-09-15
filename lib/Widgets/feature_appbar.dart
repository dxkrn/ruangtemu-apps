import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes.dart';

class FeatureAppbar extends StatelessWidget implements PreferredSizeWidget {
  FeatureAppbar({
    Key? key,
    required this.title,
    required this.iconSrc,
  }) : super(key: key);

  String title;
  String iconSrc = '';

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: whiteColor,
      elevation: 0,
      titleSpacing: 10.w,
      leadingWidth: 0,
      title: Container(
        child: Row(
          children: [
            GestureDetector(
              onTap: (() {
                Navigator.pop(context);
              }),
              child: Container(
                width: 24.w,
                height: 24.w,
                child: Image(
                  image: AssetImage(
                    'assets/icons/icon_arrow_back.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              title,
              style: heading1MediumTextStyle.copyWith(
                color: blueColor,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Container(
              width: 13.w,
              height: 13.w,
              child: Image(
                image: AssetImage(
                  iconSrc,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
