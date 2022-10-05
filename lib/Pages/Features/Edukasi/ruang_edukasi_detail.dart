import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Widgets/custom_scroll.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:ruang_temu_apps/themes.dart';

class RuangEdukasiDetail extends StatelessWidget {
  const RuangEdukasiDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FeatureAppbar(
          title: 'Ruang Edukasi', iconSrc: 'assets/icons/icon_edukasi.png'),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: ScrollConfiguration(
          behavior: CustomScroll(),
          child: ListView(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                'UNY Tours 1 - Kampus Pusat',
                style: heading1MediumTextStyle.copyWith(
                  color: blueColor,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 180.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/img_edukasi_unytours.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                '     UNY Tours merupakan sebuah kegiatan yang ditujukan untuk seluruh mahasiswa UNY dalam rangka pengenalan lingkungan kampus. UNY Tours tidak hanya dilakukan di kampus pusat saja, melainkan di kampus wilayah lain yang tersebar di beberapa wilayah Daerah Istimewa Yogyakarta. UNY Tours kali ini memilih lokasi di kampus pusat colombo Universitas Negeri Yogyakarta. Di sini terlihatt jelas lingkungan kampus yang asri dan damai memberi kenyamanan bagi para mahasiswa untuk belajar dan berdinamika di dalamnya. Banyak sekali bangunan - bangunan di kampus pusat yang dijelaskan di video ini, hal ini tentu saja membuat video UNY Tour menjadi sangat menarik untuk ditontopn dan disaksikan bersama keluarga di rumah. Jangan lupa like and subscribe channel youtube BEM KM UNY 2022 Kabinet Ruang Temu untuk menyaksikan  video UNY tours yang luar iasa ini',
                style: heading2TextStyle.copyWith(
                  color: blueColor,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 100.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
