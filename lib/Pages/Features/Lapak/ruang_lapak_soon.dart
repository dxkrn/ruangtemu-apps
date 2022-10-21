import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:ruang_temu_apps/Widgets/rounded_button.dart';
import 'package:ruang_temu_apps/themes.dart';
import 'package:get/get.dart';

class RuangLapakSoon extends StatelessWidget {
  const RuangLapakSoon({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: FeatureAppbar(
        title: 'Ruang Lapak',
        iconSrc: 'assets/icons/icon_troli.png',
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100.w,
            ),
            Hero(
              tag: 'assets/images/img_ill_lapak.png',
              child: Container(
                width: deviceWidth - 48.w,
                height: 300.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/img_ill_lapak_background.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 250.w,
              child: Text(
                "We're sorry.. Ruang Lapak will be available soon <3",
                style: heading1BoldTextStyle.copyWith(
                  color: blueColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            RoundedButton(
              width: 150.w,
              height: 50,
              text: "Kembali",
              buttonColor: blueColor,
              textColor: whiteColor,
              onPressed: () {
                Get.back();
              },
            )
          ],
        ),
      ),
    );
  }
}
