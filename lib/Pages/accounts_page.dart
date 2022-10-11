import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/StateController/user_controller.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:ruang_temu_apps/Widgets/rounded_button.dart';
import 'package:ruang_temu_apps/themes.dart';
import 'package:ruang_temu_apps/StateController/user_controller.dart';
import 'package:get/get.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();

    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: FeatureAppbar(
        title: 'Akun',
        iconSrc: 'assets/icons/icon_blank.png',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Foto Profil',
              style: heading2TextStyle.copyWith(
                color: blueColor,
              ),
            ),
            Container(
              width: deviceWidth - 48.w,
              height: 150.h,
              // color: yellowColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120.w,
                    height: 120.w,
                    child: userController.user.value.avatar == null
                        ? CircleAvatar(
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/img_male_avatar.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        : CircleAvatar(
                            backgroundImage: NetworkImage(
                                '${userController.user.value.avatar}'),
                            backgroundColor: yellowColor,
                          ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Upload Foto',
                    style: heading3TextStyle.copyWith(
                      color: blueColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: deviceWidth - 48.w,
              height: 40.h,
              margin: EdgeInsets.only(bottom: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 90.w,
                    child: Text(
                      'Nama',
                      style: heading2TextStyle.copyWith(
                        color: blueColor,
                      ),
                    ),
                  ),
                  Obx(
                    () => Container(
                      width: 230.w,
                      // color: blueColor,
                      child: TextField(
                        style: heading2TextStyle.copyWith(
                          color: blueColor,
                        ),
                        decoration: InputDecoration(
                          hintStyle: heading1MediumTextStyle.copyWith(
                            color: blueColor.withAlpha(90),
                          ),
                          hintText: userController.user.value.name,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              // color: yellowColor,
            ),
            Container(
              width: deviceWidth - 48.w,
              height: 40.h,
              margin: EdgeInsets.only(bottom: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 90.w,
                    child: Text(
                      'Prodi',
                      style: heading2TextStyle.copyWith(
                        color: blueColor,
                      ),
                    ),
                  ),
                  Container(
                    width: 230.w,
                    // color: blueColor,
                    child: TextField(
                      style: heading2TextStyle.copyWith(
                        color: blueColor,
                      ),
                      decoration: InputDecoration(
                          hintStyle: heading1MediumTextStyle.copyWith(
                            color: blueColor.withAlpha(90),
                          ),
                          // hintText: 'S1-Teknologi Informasi',
                          hintText:
                              '${userController.user.value.studyprogram}'),
                    ),
                  ),
                ],
              ),
              // color: yellowColor,
            ),
            Container(
              width: deviceWidth - 48.w,
              height: 40.h,
              margin: EdgeInsets.only(bottom: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 90.w,
                    child: Text(
                      'Angkatan',
                      style: heading2TextStyle.copyWith(
                        color: blueColor,
                      ),
                    ),
                  ),
                  Container(
                    width: 230.w,
                    // color: blueColor,
                    child: TextField(
                      style: heading2TextStyle.copyWith(
                        color: blueColor,
                      ),
                      decoration: InputDecoration(
                        hintStyle: heading1MediumTextStyle.copyWith(
                          color: blueColor.withAlpha(90),
                        ),
                        hintText: '2021',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            RoundedButton(
              width: deviceWidth - 48,
              height: 50,
              text: 'Simpan',
              buttonColor: blueColor,
              textColor: whiteColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
