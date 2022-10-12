import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ruang_temu_apps/Widgets/custom_scroll.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:ruang_temu_apps/themes.dart';

class RuangEdukasiDetailArgs {
  String title;
  String image;
  String content;

  RuangEdukasiDetailArgs(
      {required this.title, required this.image, required this.content});
}

class RuangEdukasiDetail extends StatelessWidget {
  const RuangEdukasiDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final RuangEdukasiDetailArgs args = Get.arguments;

    return Scaffold(
      appBar: FeatureAppbar(
          title: 'Ruang Edukasi', iconSrc: 'assets/icons/icon_edukasi.png'),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: ScrollConfiguration(
          behavior: CustomScroll(),
          child: ListView(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                args.title,
                style: heading1MediumTextStyle.copyWith(
                  color: blueColor,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 180.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  image: DecorationImage(
                    image: NetworkImage(
                      args.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                args.content,
                style: heading2TextStyle.copyWith(
                  color: blueColor,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 100.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
