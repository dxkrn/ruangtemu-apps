import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:get/get.dart';
import '../../../themes.dart';

class RuangInfo extends StatelessWidget {
  const RuangInfo({super.key});

  @override
  Widget build(BuildContext context) {
    // double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: FeatureAppbar(
        title: 'Ruang Info',
        iconSrc: 'assets/icons/icon_info.png',
      ),
      body: Stack(
        children: [
          Hero(
            tag: 'assets/images/img_ill_info.png',
            child: Container(
              height: 200.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/img_ill_info_v2.png'),
                ),
              ),
            ),
          ),
          ListView(
            children: [
              Container(
                height: 200.h,
              ),
              Container(
                height: deviceHeight - 200.h,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: blueColor,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 50.w,
                      height: 2.h,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Ruang Info menyediakan informasi mengenai lomba, beasiswa, dan internship bagi mahasiswa UNY',
                      style: heading3TextStyle.copyWith(
                        color: whiteColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InfoCard(
                      id: '/infoKalender',
                      iconSrc: 'assets/icons/icon_calendar.png',
                      title: 'Kalender Akademik dan Lomba',
                    ),
                    InfoCard(
                      id: '/infoInternshipPage',
                      iconSrc: 'assets/icons/icon_internship.png',
                      title: 'Internship',
                    ),
                    InfoCard(
                      id: '/infoBeasiswaPage',
                      iconSrc: 'assets/icons/icon_beasiswa.png',
                      title: 'Beasiswa',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  InfoCard({
    Key? key,
    required this.id,
    required this.iconSrc,
    required this.title,
  }) : super(key: key);

  String id;
  String iconSrc;
  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(id);
          },
          child: Container(
            padding: EdgeInsets.all(10.w),
            width: 320.w,
            height: 75.h,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 40.h,
                  height: 40.h,
                  child: Image(
                    image: AssetImage(iconSrc),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  title,
                  style: heading2TextStyle.copyWith(
                    color: blueColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
