import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:ruang_temu_apps/themes.dart';

class InfoBeasiswaPage extends StatelessWidget {
  const InfoBeasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: FeatureAppbar(
        title: 'Beasiswa',
        iconSrc: 'assets/icons/icon_blank.png',
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: 110.h,
                ),
                InfoBeasiswaCard(
                  deviceWidth: deviceWidth,
                  id: '1',
                  imgSrc: 'assets/images/img_info_beasiswa_1.png',
                  title: 'Open Donation Beasiswa Satyakarta',
                ),
                InfoBeasiswaCard(
                  deviceWidth: deviceWidth,
                  id: '1',
                  imgSrc: 'assets/images/img_info_beasiswa_1.png',
                  title: 'Open Donation Beasiswa Satyakarta',
                ),
                InfoBeasiswaCard(
                  deviceWidth: deviceWidth,
                  id: '1',
                  imgSrc: 'assets/images/img_info_beasiswa_1.png',
                  title: 'Open Donation Beasiswa Satyakarta',
                ),
                InfoBeasiswaCard(
                  deviceWidth: deviceWidth,
                  id: '1',
                  imgSrc: 'assets/images/img_info_beasiswa_1.png',
                  title: 'Open Donation Beasiswa Satyakarta',
                ),
              ],
            ),
          ),
          Positioned(
            top: 20.h,
            left: 24.w,
            child: Container(
              alignment: Alignment.center,
              width: deviceWidth - 48.w,
              height: 70.h,
              decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(
                      0,
                      2,
                    ),
                  ),
                ],
              ),
              child: Text(
                'Dapatkan Dana Penunjang Pendidikan Universitas',
                style: heading1BoldTextStyle.copyWith(
                  color: whiteColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoBeasiswaCard extends StatelessWidget {
  InfoBeasiswaCard({
    Key? key,
    required this.deviceWidth,
    required this.id,
    required this.imgSrc,
    required this.title,
  }) : super(key: key);

  final double deviceWidth;
  String id;
  String imgSrc;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        10.w,
      ),
      margin: EdgeInsets.only(
        bottom: 20.h,
      ),
      width: deviceWidth - 48.w,
      height: 150.h,
      decoration: BoxDecoration(
        color: blueColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Row(
          children: [
            Container(
              width: 150.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
                image: DecorationImage(
                  image: AssetImage(imgSrc),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 140.w,
                  child: Text(
                    title,
                    style: heading2TextStyle.copyWith(
                      color: whiteColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: 140.w,
                  child: Text(
                    'Kementerian Advokesma\nBEM KM UNY 2022',
                    style: heading4TextStyle.copyWith(
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
