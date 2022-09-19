import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';

import '../../../themes.dart';

class InfoInternhipPage extends StatelessWidget {
  const InfoInternhipPage({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: FeatureAppbar(
        title: 'Internship',
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
                InfoInternshipCard(
                  deviceWidth: deviceWidth,
                  id: '1',
                  imgSrc: 'assets/images/img_info_internship_1.png',
                  title: 'Design Grafis',
                  category: 'Freelance',
                  company: 'PT Mencari Cinta Sejati',
                ),
                InfoInternshipCard(
                  deviceWidth: deviceWidth,
                  id: '2',
                  imgSrc: 'assets/images/img_info_internship_2.png',
                  title: 'UI/UX Designer',
                  category: 'Internship',
                  company: 'PT Mencari Apa aja',
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
                'Internship Expo 2022',
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

class InfoInternshipCard extends StatelessWidget {
  InfoInternshipCard({
    Key? key,
    required this.deviceWidth,
    required this.id,
    required this.imgSrc,
    required this.title,
    required this.category,
    required this.company,
  }) : super(key: key);

  final double deviceWidth;
  String id;
  String imgSrc;
  String title;
  String category;
  String company;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/infoInternshipDetail');
      },
      child: Container(
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
                    height: 5.h,
                  ),
                  SizedBox(
                    width: 140.w,
                    child: Text(
                      category,
                      style: heading3TextStyle.copyWith(
                        color: whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 140.w,
                    child: Text(
                      company,
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
      ),
    );
  }
}
