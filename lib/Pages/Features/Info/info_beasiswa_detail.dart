import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Widgets/custom_scroll.dart';
import 'package:ruang_temu_apps/themes.dart';

import '../../../Widgets/feature_appbar.dart';

class InfoBeasiswaDetail extends StatelessWidget {
  const InfoBeasiswaDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FeatureAppbar(
        title: 'Beasiswa',
        iconSrc: 'assets/icons/icon_blank.png',
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: ScrollConfiguration(
          behavior: CustomScroll(),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Open Donation Beasiswa Satyakarta',
                  style: heading1MediumTextStyle.copyWith(
                    color: blueColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 300.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  // color: yellowColor,
                  image: DecorationImage(
                    image: AssetImage('assets/images/img_info_beasiswa_1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Dibutuhkan segera\nMahasiswa uenyeh untuk mengikuti program kerjasama dengan PT Mencari Cinta Sejati sebagai UI/UX Designer. \n\nPersyaratan: \nMempunyai pengalaman pekerjaan 3000 tahun\nMampu bekerja dalam tekanan\nMampu bekerja dengan tim\nMampu menjadi pemimpin\nMau belajar dan ingin berkembang\nNaik haji jika mampu\nSilahkan apply CV anda ke bit.ly/UI-UX-Designer\n\nCategory: Internship',
                  style: heading2TextStyle.copyWith(
                    color: blueColor,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
