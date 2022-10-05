import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Widgets/custom_scroll.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';

import '../../../Widgets/dialog_box.dart';
import '../../../Widgets/rounded_button.dart';
import '../../../themes.dart';

class RuangLapak extends StatefulWidget {
  const RuangLapak({super.key});

  @override
  State<RuangLapak> createState() => _RuangLapakState();
}

class _RuangLapakState extends State<RuangLapak> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: FeatureAppbar(
          title: 'Ruang Lapak', iconSrc: 'assets/icons/icon_troli.png'),
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior: CustomScroll(),
            child: ListView(
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70.h,
                      ),
                      Container(
                        width: 330.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: yellowColor,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 140.w,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  bottomLeft: Radius.circular(20.r),
                                ),
                              ),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/img_ill_lapak.png'),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                right: 10.w,
                              ),
                              width: 180.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ruang Lapak',
                                    style: heading1BoldTextStyle.copyWith(
                                      color: blueColor,
                                    ),
                                  ),
                                  Text(
                                    'Marketplace bagi mahasiswa UNY yang memiliki usaha dan partnership BEM KM UNY',
                                    style: heading4TextStyle.copyWith(
                                      color: blueColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                        height: 30.h,
                        child: ScrollConfiguration(
                          behavior: CustomScroll(),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(
                                width: 20.w,
                              ),
                              CategoriesButton(
                                id: '0',
                                text: 'Semua',
                                isActive: true,
                              ),
                              CategoriesButton(
                                id: '1',
                                text: 'Populer',
                              ),
                              CategoriesButton(
                                id: '2',
                                text: 'Baru-baru ini',
                              ),
                              CategoriesButton(
                                id: '3',
                                text: 'Rekomendasi',
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: GridView.count(
                          crossAxisCount: 2,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          childAspectRatio: 3 / 5,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          children: [
                            ProductCardLapak(
                              id: '1',
                              imageSrc: 'assets/images/img_produk_1.png',
                              title: 'Jus Sehat',
                              price: '10.000',
                            ),
                            ProductCardLapak(
                              id: '2',
                              imageSrc: 'assets/images/img_produk_2.png',
                              title: 'Kopi',
                              price: '15.000',
                            ),
                            ProductCardLapak(
                              id: '3',
                              imageSrc: 'assets/images/img_produk_3.png',
                              title: 'Daging Domba',
                              price: '100.000',
                            ),
                            ProductCardLapak(
                              id: '1',
                              imageSrc: 'assets/images/img_produk_4.png',
                              title: 'Mobil',
                              price: '600.000.000',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
              ],
            ),
          ),
          Container(
            width: deviceWidth,
            height: 50.h,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  width: 270.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: TextField(
                    style: heading1MediumTextStyle.copyWith(
                      color: whiteColor,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: heading1MediumTextStyle.copyWith(
                        color: whiteColor,
                      ),
                      hintText: 'Coba "UNY Tours"',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          print('tapped');
                        },
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/icon_search.png'),
                            ),
                          ),
                        ),
                      ),
                      suffixIconConstraints: const BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: ((context) {
                        return DialogBox(
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Apa yang ingin Anda cari?',
                                style: heading1MediumTextStyle.copyWith(
                                  color: blueColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10.h),
                                height: 20.h,
                                // color: yellowColor,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Olahraga',
                                      style: heading2TextStyle.copyWith(
                                        color: blueColor,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                          width: 15.h,
                                          height: 15.h,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/icons/icon_check_blue.png'),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              RoundedButton(
                                width: 100.w,
                                height: 35.h,
                                text: 'Okay',
                                buttonColor: blueColor,
                                textColor: whiteColor,
                                onPressed: () {},
                              )
                            ],
                          ),
                          height: 200.h,
                        );
                      }),
                    );
                  },
                  child: Container(
                    width: 40.h,
                    height: 40.h,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: const Image(
                      image: AssetImage('assets/icons/icon_filter.png'),
                    ),
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

class ProductCardLapak extends StatelessWidget {
  ProductCardLapak({
    Key? key,
    required this.id,
    required this.imageSrc,
    required this.title,
    required this.price,
  }) : super(key: key);

  String id;
  String imageSrc;
  String title;
  String price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/lapakDetail');
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220.w,
              decoration: BoxDecoration(
                color: yellowColor,
                borderRadius: BorderRadius.circular(20.r),
                image: DecorationImage(
                  image: AssetImage(imageSrc),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              title,
              style: heading2TextStyle.copyWith(
                color: blueColor,
              ),
            ),
            Text(
              'Rp $price',
              style: heading4TextStyle.copyWith(
                color: blueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriesButton extends StatefulWidget {
  CategoriesButton({
    Key? key,
    required this.id,
    required this.text,
    this.isActive = false,
  }) : super(key: key);

  String id;
  String text;
  bool isActive;

  @override
  State<CategoriesButton> createState() => _CategoriesButtonState();
}

class _CategoriesButtonState extends State<CategoriesButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isActive = !widget.isActive;
        });
      },
      child: Row(
        children: [
          widget.isActive
              ? Container(
                  alignment: Alignment.center,
                  width: 120.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: blueColor,
                  ),
                  child: Text(
                    widget.text,
                    style: heading3TextStyle.copyWith(
                      color: whiteColor,
                    ),
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  width: 120.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: blueColor,
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    widget.text,
                    style: heading3TextStyle.copyWith(
                      color: blueColor,
                    ),
                  ),
                ),
          SizedBox(
            width: 20.w,
          ),
        ],
      ),
    );
  }
}
