import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/themes.dart';
import 'package:get/get.dart';

class Navbar extends StatefulWidget {
  int page = 0;
  Navbar({super.key, required this.page});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  // int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List<String> pageName = [
    '/',
    '/aspirasi',
    '/lapakSoon',
    '/info',
    '/settingsPage'
  ];

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      // index: _page,
      index: widget.page,
      height: 60.0,
      items: <Widget>[
        SizedBox(
          width: 25.h,
          height: 25.h,
          child: Image(
            image: widget.page == 0
                ? AssetImage('assets/icons/icon_navbar_home_active.png')
                : AssetImage('assets/icons/icon_navbar_home.png'),
          ),
        ),
        SizedBox(
          width: 25.h,
          height: 25.h,
          child: Image(
            image: widget.page == 1
                ? AssetImage('assets/icons/icon_navbar_aspirasi_active.png')
                : AssetImage('assets/icons/icon_navbar_aspirasi.png'),
          ),
        ),
        SizedBox(
          width: 25.h,
          height: 25.h,
          child: Image(
            image: widget.page == 2
                ? AssetImage('assets/icons/icon_navbar_lapak_active.png')
                : AssetImage('assets/icons/icon_navbar_lapak.png'),
          ),
        ),
        SizedBox(
          width: 25.h,
          height: 25.h,
          child: Image(
            image: widget.page == 3
                ? AssetImage('assets/icons/icon_navbar_info_active.png')
                : AssetImage('assets/icons/icon_navbar_info.png'),
          ),
        ),
        SizedBox(
          width: 25.h,
          height: 25.h,
          child: Image(
            image: widget.page == 4
                ? AssetImage('assets/icons/icon_navbar_settings_active.png')
                : AssetImage('assets/icons/icon_navbar_settings.png'),
          ),
        ),
      ],
      // color: const Color(0xff6615f5),
      // buttonBackgroundColor: const Color(0xff6615f5),
      color: Color.fromARGB(255, 13, 28, 48),
      buttonBackgroundColor: Color.fromARGB(255, 13, 28, 48),
      backgroundColor: Color.fromARGB(1, 255, 255, 255),

      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      onTap: (index) {
        setState(() {
          // _page = index;
          widget.page = index;
          Get.offAllNamed(pageName[index]);
          // print('Page $_page');
          print("ge.offAllNamed('${pageName[index]}')");
        });
      },
      letIndexChange: (index) => true,
    );
  }
}
