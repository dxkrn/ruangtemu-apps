// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/themes.dart';

import '../../../Widgets/feature_appbar.dart';

class RuangAspirasiPage extends StatelessWidget {
  const RuangAspirasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FeatureAppbar(
        title: 'Ruang Aspirasi',
        iconSrc: 'assets/icons/icon_mail.png',
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Stack(
            children: [
              ListView(
                children: [
                  SizedBox(
                    height: 90.h,
                  ),
                  AspirasiCard(
                    id: '1',
                    imgSrc: 'assets/images/img_male_avatar.png',
                    name: 'Hery Gunawan',
                    content:
                        'Tolong, aku adalah ubur-ubur yang kesepian, merana, dan butuh teman ataupun orang yang bisa aku jadikan teman cerita tentang apa semua yang udah aku alamin.',
                    commentCount: 127,
                  ),
                  AspirasiCard(
                    id: '2',
                    imgSrc: 'assets/images/img_female_avatar.png',
                    name: 'Susy Susanti',
                    content:
                        'Gatau mau nulis apa yang penting kalimatnya panjang aja kali ya ehehe, biar keliatan text overflownya aha si ahaha.',
                    commentCount: 956,
                  ),
                ],
              ),
              TitleTextBanner(
                title: 'Aspirasi yang telah tertampung',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AspirasiCard extends StatelessWidget {
  AspirasiCard({
    Key? key,
    required this.id,
    required this.imgSrc,
    required this.name,
    required this.content,
    required this.commentCount,
  }) : super(key: key);
  String id;
  String imgSrc;
  String name;
  String content;
  int commentCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 150.h,
          decoration: BoxDecoration(
            color: yellowColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 35.h,
                child: Row(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  imgSrc,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 250.w,
                          height: 35.h,
                          child: Text(
                            name,
                            style: heading1MediumTextStyle.copyWith(
                              color: blueColor,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                // color: blueColor,
                width: 300.w,
                height: 60.h,
                child: Text(
                  content,
                  style: heading2TextStyle.copyWith(
                    color: blueColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 3,
                ),
              ),
              SizedBox(
                // color: blueColor,
                width: 300.w,
                height: 30.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$commentCount Komentar',
                      style: heading4TextStyle.copyWith(
                        color: blueColor,
                      ),
                    ),
                    Container(
                      width: 20.h,
                      height: 20.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/icon_comment.png'),
                        ),
                      ),
                    ),
                  ],
                ),
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

class TitleTextBanner extends StatelessWidget {
  TitleTextBanner({
    Key? key,
    required this.title,
  }) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.h,
      child: Container(
        alignment: Alignment.center,
        width: 335.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: blueColor,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(
                0,
                2,
              ),
            ),
          ],
        ),
        child: Text(
          title,
          style: heading1MediumTextStyle.copyWith(
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
