import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Widgets/rounded_button.dart';
import 'package:ruang_temu_apps/themes.dart';

class RuangLapakDetail extends StatelessWidget {
  const RuangLapakDetail({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: ListView(
                children: [
                  Container(
                    height: 350.h,
                    color: whiteColor,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.r),
                          bottomRight: Radius.circular(30.r),
                        ),
                        // color: blueColor,
                        image: DecorationImage(
                          image: AssetImage('assets/images/img_produk_1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      24.w,
                    ),
                    height: deviceHeight - 350.h,
                    // color: yellowColor,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Jus Sehat',
                              style: heading1BoldTextStyle.copyWith(
                                color: blueColor,
                              ),
                            ),
                            Text(
                              'Rp 10.000',
                              style: heading2TextStyle.copyWith(
                                color: blueColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Jus sehat dengan buah asli yang dari petani lokal.',
                          style: heading2TextStyle.copyWith(
                            color: blueColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20.h,
              left: 24.w,
              child: Container(
                width: deviceWidth - 48.w,
                height: 30.h,
                // color: yellowColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 30.h,
                        height: 30.h,
                        child: Image(
                          image:
                              AssetImage('assets/icons/icon_back_circle.png'),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 30.h,
                        height: 30.h,
                        child: Image(
                          image: AssetImage(
                              'assets/icons/icon_favourite_circle.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 24.h,
              left: 48.w,
              child: RoundedButton(
                width: deviceWidth - 96.w,
                height: 50,
                text: 'Kunjungi Toko',
                buttonColor: blueColor,
                textColor: whiteColor,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
