import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:ruang_temu_apps/themes.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: FeatureAppbar(
        title: 'Settings',
        iconSrc: 'assets/icons/icon_settings.png',
      ),
      body: Container(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/accountPage');
              },
              child: Container(
                width: deviceWidth - 48.w,
                height: 120.h,
                padding: EdgeInsets.all(
                  10.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: blueColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50.h,
                      height: 50.h,
                      child: Image(
                        image: AssetImage('assets/icons/icon_akun.png'),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Akun',
                      style: heading1MediumTextStyle.copyWith(
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            SettingButton(
              deviceWidth: deviceWidth,
              imgSrc: 'assets/icons/icon_bahasa.png',
              title: 'Bahasa',
              onTap: () {},
            ),
            SettingButton(
              deviceWidth: deviceWidth,
              imgSrc: 'assets/icons/icon_notifikasi.png',
              title: 'Notifikasi',
              onTap: () {},
            ),
            SettingButton(
              deviceWidth: deviceWidth,
              imgSrc: 'assets/icons/icon_tentang.png',
              title: 'Tentang',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class SettingButton extends StatelessWidget {
  SettingButton({
    Key? key,
    required this.deviceWidth,
    required this.imgSrc,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final double deviceWidth;
  Function onTap;
  String title;
  String imgSrc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => onTap),
      child: Container(
        width: deviceWidth - 48.w,
        height: 50.h,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 5.h,
        ),
        margin: EdgeInsets.only(
          bottom: 15.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: blueColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 200.w,
              child: Row(
                children: [
                  SizedBox(
                    width: 30.h,
                    height: 30.h,
                    child: Image(
                      image: AssetImage(imgSrc),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    title,
                    style: heading1MediumTextStyle.copyWith(
                      color: whiteColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20.h,
              height: 20.h,
              child: Image(
                image: AssetImage('assets/icons/icon_arrow_next.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
