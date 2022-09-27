// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Widgets/dialog_box.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:get/get.dart';
import 'package:ruang_temu_apps/Widgets/rounded_button.dart';
import '../../../themes.dart';

class RuangEdukasi extends StatefulWidget {
  const RuangEdukasi({super.key});

  @override
  State<RuangEdukasi> createState() => _RuangEdukasiState();
}

class _RuangEdukasiState extends State<RuangEdukasi> {
  bool isCheckedKampus = true;
  bool isCheckedNasional = true;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    // double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: FeatureAppbar(
          title: 'Ruang Edukasi', iconSrc: 'assets/icons/icon_edukasi.png'),
      body: Stack(
        children: [
          ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  Container(
                    width: 330.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: yellowColor,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 140.w,
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                              bottomLeft: Radius.circular(20.r),
                            ),
                          ),
                          child: const Image(
                            image:
                                AssetImage('assets/images/img_ill_edukasi.png'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            right: 10.w,
                          ),
                          width: 180.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ruang Edukasi',
                                style: heading1BoldTextStyle.copyWith(
                                  color: blueColor,
                                ),
                              ),
                              Text(
                                'Platform konten pencerdasan dan informasi oleh kementerian di BEM KM UNY',
                                style: heading4TextStyle.copyWith(
                                  color: blueColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Container(
                    height: 30.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        CategoriesButton(
                          id: '0',
                          text: 'Semua',
                          isActive: true,
                        ),
                        CategoriesButton(
                          id: '1',
                          text: 'Populer',
                        ),
                        CategoriesButton(
                          id: '2',
                          text: 'On This Day',
                        ),
                        CategoriesButton(
                          id: '3',
                          text: 'Ter-edukatif',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  EdukasiCard(
                    id: 'unytours1',
                    imageSrc: 'assets/images/img_edukasi_unytours.png',
                    title: 'UNY Tours 1 - Kampus Pusat',
                    desc:
                        'UNY Tours merupakan sebuah kegiatan yang ditujukan untuk seluruh mahasiswa UNY dalam rangka pengenalan lingkungan kampus. UNY Tours tidak hanya dilakukan di kampus pusat saja, melainkan di kampus wilayah lain yang tersebar di beberapa wilayah Daerah Istimewa Yogyakarta. UNY Tours kali ini memilih lokasi di kampus pusat colombo Universitas Negeri Yogyakarta. Di sini terlihatt jelas lingkungan kampus yang asri dan damai memberi kenyamanan bagi para mahasiswa untuk belajar dan berdinamika di dalamnya. Banyak sekali bangunan - bangunan di kampus pusat yang dijelaskan di video ini, hal ini tentu saja membuat video UNY Tour menjadi sangat menarik untuk ditontopn dan disaksikan bersama keluarga di rumah. Jangan lupa like and subscribe channel youtube BEM KM UNY 2022 Kabinet Ruang Temu untuk menyaksikan  video UNY tours yang luar iasa ini',
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: deviceWidth,
            height: 50.h,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  width: 270.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: TextField(
                    style: heading1MediumTextStyle.copyWith(
                      color: whiteColor,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: heading1MediumTextStyle.copyWith(
                        color: whiteColor,
                      ),
                      hintText: 'Coba "UNY Tours"',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          print('tapped');
                        },
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/icon_search.png'),
                            ),
                          ),
                        ),
                      ),
                      suffixIconConstraints: const BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: (() {
                    setState(() {
                      showDialog(
                        context: context,
                        builder: ((context) {
                          return DialogBox(
                            widget: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Berita apa yang ingin Anda cari?',
                                  style: heading1MediumTextStyle.copyWith(
                                    color: blueColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                SizedBox(
                                  height: 20.h,
                                  // color: yellowColor,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Seputar Kampus',
                                        style: heading2TextStyle.copyWith(
                                          color: blueColor,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            print('Tapped');
                                            isCheckedKampus = !isCheckedKampus;
                                            print(isCheckedKampus);
                                          });
                                        },
                                        child: Container(
                                          width: 15.h,
                                          height: 15.h,
                                          decoration: isCheckedKampus
                                              ? const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/icons/icon_check_blue.png'),
                                                  ),
                                                )
                                              : const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/icons/icon_check_blue_inactive.png'),
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  height: 20.h,
                                  // color: yellowColor,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Berita Nasional',
                                        style: heading2TextStyle.copyWith(
                                          color: blueColor,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isCheckedNasional =
                                                !isCheckedNasional;
                                            print(isCheckedNasional);
                                          });
                                        },
                                        child: SizedBox(
                                          width: 15.h,
                                          height: 15.h,
                                          child: isCheckedNasional
                                              ? const Image(
                                                  image: AssetImage(
                                                      'assets/icons/icon_check_blue.png'),
                                                )
                                              : const Image(
                                                  image: AssetImage(
                                                      'assets/icons/icon_check_blue_inactive.png'),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                RoundedButton(
                                  width: 100.w,
                                  height: 35.h,
                                  text: 'Okay',
                                  buttonColor: blueColor,
                                  textColor: whiteColor,
                                  onPressed: () {},
                                )
                              ],
                            ),
                            height: 200.h,
                          );
                        }),
                      );
                    });
                  }),
                  child: Container(
                    width: 40.h,
                    height: 40.h,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: const Image(
                      image: AssetImage('assets/icons/icon_filter.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EdukasiCard extends StatelessWidget {
  EdukasiCard({
    Key? key,
    required this.id,
    required this.imageSrc,
    required this.title,
    required this.desc,
  }) : super(key: key);

  String id;
  String imageSrc;
  String title;
  String desc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/edukasiDetail');
      },
      child: SizedBox(
        width: 330.w,
        height: 250.h,
        // color: blueColor,
        child: Column(
          children: [
            Container(
              height: 180.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: yellowColor,
                image: DecorationImage(
                  image: AssetImage(
                    imageSrc,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 70.h,
              width: 330.w,
              padding: EdgeInsets.symmetric(vertical: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: heading1MediumTextStyle.copyWith(
                      color: blueColor,
                    ),
                  ),
                  Text(
                    desc,
                    style: heading2TextStyle.copyWith(
                      color: blueColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriesButton extends StatefulWidget {
  CategoriesButton({
    Key? key,
    required this.id,
    required this.text,
    this.isActive = false,
  }) : super(key: key);

  String id;
  String text;
  bool isActive;

  @override
  State<CategoriesButton> createState() => _CategoriesButtonState();
}

class _CategoriesButtonState extends State<CategoriesButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isActive = !widget.isActive;
        });
      },
      child: Row(
        children: [
          widget.isActive
              ? Container(
                  alignment: Alignment.center,
                  width: 120.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: blueColor,
                  ),
                  child: Text(
                    widget.text,
                    style: heading3TextStyle.copyWith(
                      color: whiteColor,
                    ),
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  width: 120.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: blueColor,
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    widget.text,
                    style: heading3TextStyle.copyWith(
                      color: blueColor,
                    ),
                  ),
                ),
          SizedBox(
            width: 20.w,
          ),
        ],
      ),
    );
  }
}
