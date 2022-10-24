import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:ruang_temu_apps/Widgets/navbar.dart';
import 'package:ruang_temu_apps/themes.dart';
import 'package:get/get.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final List<String> _listArticle = [
    'Dialog Intelektual #3: Realisasi Kampus Merdeka, Wajah Baru Dunia Pendidikan Indonesia',
    'Seruan Konsolidasi Lanjutan!',
    'Seruan Konsolidasi!',
    'Open Recruitment! Panitia National Entrepreneur Competition 2022',
    'Workshop Creative Relations #1: Online TOEFL Preparation',
    'Open Recruitment! Koordinator Umum PKKMB UNY 2022',
    'Open Registration! Kominfo Club',
    'Open Recruitment! Mitra Usaha Binaan 2022',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Navbar(page: 3),
      appBar: FeatureAppbar(
        title: 'Ruang Info',
        iconSrc: 'assets/icons/icon_info.png',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Text(
              'Artikel',
              style: heading1BoldTextStyle.copyWith(color: blueColor),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        width: Get.width,
                        // height: 200.h,
                        // color: blueColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _listArticle[index],
                              style: heading1MediumTextStyle.copyWith(
                                color: blueColor,
                              ),
                            ),
                            Container(
                              height: 0.5,
                              width: Get.width,
                              color: blueColor,
                            ),
                          ],
                        ),
                      );
                    })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
