import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ruang_temu_apps/Pages/Features/Edukasi/ruang_edukasi.dart';
import 'package:ruang_temu_apps/Pages/Features/Edukasi/ruang_edukasi_detail.dart';
import 'package:ruang_temu_apps/Pages/Features/Info/info_internship_detail.dart';
import 'package:ruang_temu_apps/Pages/Features/Info/info_internship_page.dart';
import 'package:ruang_temu_apps/Pages/Features/Lapak/ruang_lapak.dart';
import 'package:ruang_temu_apps/Pages/Features/Lapak/ruang_lapak_detail.dart';
import 'package:ruang_temu_apps/Pages/accounts_page.dart';
import 'package:ruang_temu_apps/Pages/settings_page.dart';

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
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => const HomePage(),
          ),
          GetPage(
            name: '/onboard',
            page: () => const OnboardPage(),
          ),

          //HaloUNY
          GetPage(
            name: '/halouny',
            page: () => const HalounyPage(),
            transition: Transition.fade,
            transitionDuration: const Duration(
              milliseconds: 500,
            ),
          ),

          //Aspirasi
          GetPage(
            name: '/aspirasi',
            page: () => const RuangAspirasiForm(),
            transition: Transition.fade,
            transitionDuration: const Duration(
              milliseconds: 500,
            ),
          ),
          GetPage(
            name: '/aspirasiThanks',
            page: () => const RuangAspirasiThanks(),
            transition: Transition.fade,
            transitionDuration: const Duration(
              milliseconds: 500,
            ),
          ),
          GetPage(
            name: '/aspirasiPage',
            page: () => const RuangAspirasiPage(),
            transition: Transition.fade,
            transitionDuration: const Duration(
              milliseconds: 500,
            ),
          ),

          //Info
          GetPage(
            name: '/info',
            page: () => const RuangInfo(),
            transition: Transition.fade,
            transitionDuration: const Duration(
              milliseconds: 500,
            ),
          ),
          GetPage(
            name: '/infoBeasiswaPage',
            page: () => const InfoBeasiswaPage(),
            transition: Transition.fade,
            transitionDuration: const Duration(
              milliseconds: 500,
            ),
          ),
          GetPage(
            name: '/infoBeasiswaDetail',
            page: () => const InfoBeasiswaDetail(),
            transition: Transition.fade,
            transitionDuration: const Duration(
              milliseconds: 500,
            ),
          ),
          GetPage(
            name: '/infoInternshipPage',
            page: () => const InfoInternhipPage(),
            transition: Transition.fade,
            transitionDuration: const Duration(
              milliseconds: 500,
            ),
          ),
          GetPage(
            name: '/infoInternshipDetail',
            page: () => const InfoInternshipDetail(),
            transition: Transition.fade,
            transitionDuration: const Duration(
              milliseconds: 500,
            ),
          ),

          //Survey
          GetPage(
            name: '/survey',
            page: () => const RuangSurvey(),
            transition: Transition.fade,
            transitionDuration: const Duration(
              milliseconds: 500,
            ),
          ),

          //Edukasi
          GetPage(
            name: '/edukasi',
            page: () => const RuangEdukasi(),
            transition: Transition.fade,
            transitionDuration: const Duration(
              milliseconds: 500,
            ),
          ),
          GetPage(
            name: '/edukasiDetail',
            page: () => const RuangEdukasiDetail(),
            transition: Transition.fade,
            transitionDuration: const Duration(
              milliseconds: 500,
            ),
          ),

          //Lapak
          GetPage(
            name: '/lapak',
            page: () => const RuangLapak(),
            transition: Transition.fade,
            transitionDuration: const Duration(
              milliseconds: 500,
            ),
          ),
          GetPage(
            name: '/lapakDetail',
            page: () => const RuangLapakDetail(),
            transition: Transition.fade,
            transitionDuration: const Duration(
              milliseconds: 500,
            ),
          ),

          //Settings
          GetPage(
            name: '/settingsPage',
            page: () => const SettingsPage(),
            transition: Transition.fade,
            transitionDuration: const Duration(
              milliseconds: 500,
            ),
          ),
          GetPage(
            name: '/accountPage',
            page: () => const AccountsPage(),
            transition: Transition.fade,
            transitionDuration: const Duration(
              milliseconds: 500,
            ),
          ),
        ],
      ),
      designSize: const Size(375, 667),
    );
  }
}
