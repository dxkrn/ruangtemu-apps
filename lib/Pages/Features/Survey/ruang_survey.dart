// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';

import '../../../themes.dart';

class RuangSurvey extends StatelessWidget {
  const RuangSurvey({super.key});

  @override
  Widget build(BuildContext context) {
    // double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: FeatureAppbar(
        title: 'Ruang Survey',
        iconSrc: 'assets/icons/icon_survey.png',
      ),
      body: Stack(
        children: [
          Hero(
            tag: 'assets/images/img_ill_survey.png',
            child: Container(
              height: 200.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/img_ill_survey.png'),
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
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      child: Text(
                        'Ruang Survey berisi survey menarik yang dikelola oleh Kementerian Riset dan Data BEM KM UNY',
                        style: heading3TextStyle.copyWith(
                          color: whiteColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SurveyCard(
                      id: '1',
                      title:
                          'Survey Kepuasan Mahasiswa Terhadap  Fasilitas Kampus',
                    ),
                    SurveyCard(
                      id: '2',
                      title: 'Survey Pembelajaran Offline',
                    ),
                    SurveyCard(
                      id: '3',
                      title: 'Survey Kepuasan Ruang Temu Apps',
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

class SurveyCard extends StatelessWidget {
  SurveyCard({
    Key? key,
    required this.id,
    required this.title,
  }) : super(key: key);

  String id;
  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
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
                  child: const Image(
                    image: AssetImage('assets/icons/icon_survey_light.png'),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 240.w,
                  height: 55.h,
                  child: Text(
                    title,
                    style: heading2TextStyle.copyWith(
                      color: blueColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
