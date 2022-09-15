import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Widgets/rounded_button.dart';
import 'package:ruang_temu_apps/Widgets/rounded_button_border.dart';
import 'package:ruang_temu_apps/themes.dart';

import '../../../Widgets/feature_appbar.dart';

class RuangAspirasiThanks extends StatelessWidget {
  const RuangAspirasiThanks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FeatureAppbar(
        title: 'Ruang Aspirasi',
        iconSrc: 'assets/icons/icon_mail.png',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                width: 280.w,
                height: 220.h,
                child: const Image(
                  image: AssetImage(
                    'assets/images/img_ill_thanks.png',
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                child: Text(
                  'Terimakasih, aspirasi mu sangat berharga untuk kami <3',
                  style: heading1MediumTextStyle.copyWith(
                    color: blueColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              RoundedButton(
                width: 230,
                height: 40,
                text: 'Lihat Aspirasi Lain',
                buttonColor: blueColor,
                textColor: whiteColor,
                onPressed: () {
                  Navigator.pushNamed(context, '/aspirasiPage');
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              RoundedButtonBorder(
                width: 230,
                height: 40,
                text: 'Kembali ke Homepage',
                borderColor: blueColor,
                borderWidth: 2,
                textColor: blueColor,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
