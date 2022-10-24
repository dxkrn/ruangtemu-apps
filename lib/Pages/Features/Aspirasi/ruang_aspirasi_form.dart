import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Widgets/custom_scroll.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:ruang_temu_apps/Widgets/navbar.dart';
import 'package:ruang_temu_apps/Widgets/rounded_button.dart';
import 'package:ruang_temu_apps/Widgets/rounded_button_border.dart';
import 'package:ruang_temu_apps/env.dart';
import 'package:ruang_temu_apps/http_client.dart';
import 'package:ruang_temu_apps/themes.dart';
import 'package:get/get.dart';

class RuangAspirasiForm extends StatefulWidget {
  const RuangAspirasiForm({super.key});

  @override
  State<RuangAspirasiForm> createState() => _RuangAspirasiFormState();
}

class _RuangAspirasiFormState extends State<RuangAspirasiForm> {
  bool isChecked = false;

  final TextEditingController _messageController = TextEditingController();

  void handleSubmit() async {
    if (_messageController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Isi pesan terlebih dahulu',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      httpClient.post("$baseAPIUrl/aspirations", {
        "message": _messageController.value.text,
        "is_anonymous": isChecked.toString()
      }).then((value) {
        print(value.body);
        Get.snackbar(
          'Berhasil',
          'Aspirasi berhasil dikirim',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        _messageController.clear();
        Get.toNamed('/aspirasiThanks');
      }).catchError((error) {
        Get.snackbar(
          'Error',
          'Aspirasi gagal dikirim',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Navbar(page: 1),
      appBar: FeatureAppbar(
        title: 'Ruang Aspirasi',
        iconSrc: 'assets/icons/icon_mail.png',
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Container(
                height: 200.h,
                color: blueColor,
              ),
            ],
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
                            controller: _messageController,
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
                                handleSubmit();
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
