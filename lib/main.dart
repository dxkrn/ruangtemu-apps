import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Pages/Features/Edukasi/ruang_edukasi.dart';
import 'package:ruang_temu_apps/Pages/Features/Edukasi/ruang_edukasi_detail.dart';
import 'package:ruang_temu_apps/Pages/Features/Info/info_internship_detail.dart';
import 'package:ruang_temu_apps/Pages/Features/Info/info_internship_page.dart';
import 'package:ruang_temu_apps/Pages/Features/Lapak/ruang_lapak.dart';
import 'package:ruang_temu_apps/Pages/Features/Lapak/ruang_lapak_detail.dart';

import 'Pages/Features/Aspirasi/ruang_aspirasi_form.dart';
import 'Pages/Features/Aspirasi/ruang_aspirasi_page.dart';
import 'Pages/Features/Aspirasi/ruang_aspirasi_thanks.dart';
import 'Pages/Features/HaloUNY/halouny_page.dart';
import 'Pages/Features/Info/info_beasiswa_detail.dart';
import 'Pages/Features/Info/info_beasiswa_page.dart';
import 'Pages/Features/Info/ruang_info.dart';
import 'Pages/Features/Survey/ruang_survey.dart';
import 'Pages/home_page.dart';
import 'Pages/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/onboard': (context) => const OnboardPage(),

          //HaloUNY!
          '/halouny': (context) => const HalounyPage(),

          //Aspirasi
          '/aspirasi': (context) => const RuangAspirasiForm(),
          '/aspirasiThanks': (context) => const RuangAspirasiThanks(),
          '/aspirasiPage': (context) => const RuangAspirasiPage(),

          //Info
          '/info': (context) => const RuangInfo(),
          '/infoBeasiswaPage': (context) => const InfoBeasiswaPage(),
          '/infoBeasiswaDetail': (context) => const InfoBeasiswaDetail(),
          '/infoInternshipPage': (context) => const InfoInternhipPage(),
          '/infoInternshipDetail': (context) => const InfoInternshipDetail(),

          //Survey
          '/survey': (context) => const RuangSurvey(),

          //Edukasi
          '/edukasi': (context) => const RuangEdukasi(),
          '/edukasiDetail': (context) => const RuangEdukasiDetail(),

          //Lapak
          '/lapak': (context) => const RuangLapak(),
          '/lapakDetail': (context) => const RuangLapakDetail(),
        },
      ),
      designSize: const Size(375, 667),
    );
  }
}
