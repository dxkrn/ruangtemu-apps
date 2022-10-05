import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Widgets/custom_scroll.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:ruang_temu_apps/Widgets/rounded_button.dart';
import 'package:ruang_temu_apps/Widgets/rounded_button_border.dart';
import 'package:ruang_temu_apps/themes.dart';
import 'package:get/get.dart';

class RuangAspirasiForm extends StatefulWidget {
  const RuangAspirasiForm({super.key});

  @override
  State<RuangAspirasiForm> createState() => _RuangAspirasiFormState();
}

class _RuangAspirasiFormState extends State<RuangAspirasiForm> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    // double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: FeatureAppbar(
        title: 'Ruang Aspirasi',
        iconSrc: 'assets/icons/icon_mail.png',
      ),
      body: Stack(
        children: [
          Hero(
            tag: 'assets/images/img_ill_aspirasi.png',
            child: Container(
              height: 200.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/img_ill_aspirasi.png'),
                ),
              ),
            ),
          ),
          ScrollConfiguration(
            behavior: CustomScroll(),
            child: ListView(
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
                          'Ruang Aspirasi merupakan sarana menyalurkan aspirasi kepada BEM KM UNY untuk perbaikan dan gerakan selanjutnya bagi KM UNY dan Indonesia',
                          style: heading3TextStyle.copyWith(
                            color: whiteColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        height: 160.h,
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: whiteColor,
                              width: 2.w,
                            ),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 7,
                            style: heading1MediumTextStyle.copyWith(
                              color: whiteColor,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: heading1MediumTextStyle.copyWith(
                                color: whiteColor.withAlpha(90),
                              ),
                              hintMaxLines: 7,
                              hintText:
                                  'Kirim pesan untuk menyampaikan aspirasi',
                            ),
                          ),
                        ),
                      ),

                      //checklist
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        height: 50.h,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isChecked = !isChecked;
                                });
                              },
                              child: isChecked
                                  ? Container(
                                      width: 20.h,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        border: Border.all(
                                          color: whiteColor,
                                          width: 2,
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      width: 20.h,
                                      height: 20.h,
                                      child: const Image(
                                        image: AssetImage(
                                            'assets/icons/icon_check.png'),
                                      ),
                                    ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            SizedBox(
                              width: 300.w,
                              child: Text(
                                'Centang untuk mengirimkan secara anonymous, identitas Anda tidak akan diketahui',
                                maxLines: 3,
                                style: heading3TextStyle.copyWith(
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RoundedButtonBorder(
                              width: 200.w,
                              height: 40.h,
                              text: 'Lihat Aspirasi Lain',
                              borderColor: yellowColor,
                              borderWidth: 2,
                              textColor: yellowColor,
                              onPressed: () {
                                Get.toNamed('/aspirasiPage');
                              },
                            ),
                            RoundedButton(
                              width: 120.w,
                              height: 40.h,
                              text: 'Kirim',
                              buttonColor: yellowColor,
                              textColor: blueColor,
                              onPressed: () {
                                Get.toNamed('/aspirasiThanks');
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
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
