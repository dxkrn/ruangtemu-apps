// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:ruang_temu_apps/themes.dart';

class HalounyPage extends StatelessWidget {
  const HalounyPage({super.key});

  @override
  Widget build(BuildContext context) {
    // double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: FeatureAppbar(
        title: 'HaloUNY!',
        iconSrc: 'assets/icons/icon_phone.png',
      ),
      body: Stack(
        children: [
          Hero(
            tag: 'assets/images/img_ill_halouny.png',
            child: Container(
              height: 200.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/img_ill_halouny.png'),
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
                      'HalloUNY! adalah Call Center untuk menerima layanan\naduan mengenai masalah di lingkungan kampus.',
                      style: heading3TextStyle.copyWith(
                        color: whiteColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CallCenterCard(
                      imgSrc: 'assets/logos/logo_advokesma.png',
                      title: 'Call Center Aduan\nMasalah Briokrasi',
                      subtitle:
                          'Layanan aduan mengenai bantuan UKT,\nakademik, fasilitas, dan lain sebagainya',
                    ),
                    CallCenterCard(
                      imgSrc: 'assets/logos/logo_pp.png',
                      title: 'Call Center Aduan\nKekerasan Seksual',
                      subtitle:
                          'Layanan aduan mengenai kekerasan\nseksual di kampus',
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

class CallCenterCard extends StatelessWidget {
  CallCenterCard({
    Key? key,
    required this.imgSrc,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  String imgSrc;
  String title;
  String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: 320.w,
          height: 0.375 * 320.w,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 70.w,
                child: Image(
                  image: AssetImage(imgSrc),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: heading1BoldTextStyle.copyWith(
                      color: blueColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: heading4TextStyle.copyWith(
                      color: blueColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
