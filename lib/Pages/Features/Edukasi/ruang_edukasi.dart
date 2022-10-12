// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Models/news.dart';
import 'package:ruang_temu_apps/Pages/Features/Edukasi/ruang_edukasi_detail.dart';
import 'package:ruang_temu_apps/Widgets/custom_scroll.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:get/get.dart';
import 'package:ruang_temu_apps/env.dart';
import 'package:ruang_temu_apps/http_client.dart';
import 'package:ruang_temu_apps/themes.dart';

class RuangEdukasiArgs {
  String? defaultCategory;
  String? defaultSearch;

  RuangEdukasiArgs({
    this.defaultCategory,
    this.defaultSearch,
  });
}

class RuangEdukasi extends StatefulWidget {
  const RuangEdukasi({super.key});

  @override
  State<RuangEdukasi> createState() => _RuangEdukasiState();
}

class _RuangEdukasiState extends State<RuangEdukasi> {
  bool isCheckedKampus = true;
  bool isCheckedNasional = true;

  String selectedCategory = 'Semua';
  List<String> availableCategories = [];
  List<String> selectedCategories = [];
  late ScrollController _controller;
  int _page = 0;
  final int _limit = 10;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  List<News> _news = [];

  String search = '';

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    final res = await httpClient.get(
        "$baseAPIUrl/news?page=$_page&limit=$_limit&category=$selectedCategory&search=$search");

    if (res.statusCode == 200) {
      setState(() {
        Map<String, dynamic> m = json.decode(res.body);

        Iterable l = m['data'];
        _news = List<News>.from(l.map((model) => News.fromJson(model)));
      });
    } else {
      throw Exception('Failed to load news on first');
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
        _page++; // Increase _page by 1
      });
      final res = await httpClient.get(
          "$baseAPIUrl/news?page=$_page&limit=$_limit&category=$selectedCategory&search=$search");

      if (res.statusCode == 200) {
        Map<String, dynamic> m = json.decode(res.body);
        String? nextPageUrl = m['next_page_url'];

        setState(() {
          _hasNextPage = nextPageUrl != null;
        });

        Iterable l = m['data'];
        final List<News> fetchedPosts =
            List<News>.from(l.map((model) => News.fromJson(model)));

        if (fetchedPosts.isNotEmpty) {
          setState(() {
            _news.addAll(fetchedPosts);
          });
        } else {
          // This means there is no more data
          // and therefore, we will not send another GET request
          setState(() {
            _hasNextPage = false;
          });
        }
      } else {
        throw Exception('Failed to load news on next');
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  void handleReset() {
    setState(() {
      _page = 0;
      _hasNextPage = true;
      _news = [];
    });
  }

  void handleCategoryChange(String category) {
    handleReset();
    setState(() {
      selectedCategory = category;
    });
    _firstLoad();
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);

    if (Get.arguments != null) {
      final args = Get.arguments as RuangEdukasiArgs;
      setState(() {
        search = args.defaultSearch ?? '';
        selectedCategory = args.defaultCategory ?? 'Semua';
      });
    } else {
      try {
        httpClient.get("$baseAPIUrl/").then((value) {
          var data = jsonDecode(value.body);
          setState(() {
            selectedCategory = data['default-category'];
          });
        });
        // ignore: empty_catches
      } catch (e) {}
    }

    httpClient.get("$baseAPIUrl/news-categories").then((value) {
      var data = jsonDecode(value.body);
      setState(() {
        // convert to list of string
        availableCategories = List<String>.from(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    // double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: FeatureAppbar(
          title: 'Ruang Edukasi', iconSrc: 'assets/icons/icon_edukasi.png'),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                    width: 300.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          search = value;
                        });
                      },
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
                            handleReset();
                            _firstLoad();
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/icons/icon_search.png'),
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

                  // GestureDetector(
                  //   onTap: (() {
                  //     setState(() {
                  //       showDialog(
                  //         context: context,
                  //         builder: ((context) {
                  //           return DialogBox(
                  //             widget: Column(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Text(
                  //                   'Berita apa yang ingin Anda cari?' +
                  //                       selectedCategories.toString(),
                  //                   style: heading1MediumTextStyle.copyWith(
                  //                     color: blueColor,
                  //                   ),
                  //                   textAlign: TextAlign.center,
                  //                 ),
                  //                 SizedBox(
                  //                   height: 20.h,
                  //                 ),
                  //                 Container(
                  //                   width: 300.w,
                  //                   height: 40.h,
                  //                   child: ListView.builder(
                  //                     itemCount: availableCategories.length,
                  //                     itemBuilder: (context, index) {
                  //                       return GestureDetector(
                  //                         onTap: () {
                  //                           handleCategoryChange(
                  //                               availableCategories[index]);
                  //                           Get.back();
                  //                         },
                  //                         child: Row(
                  //                           mainAxisAlignment:
                  //                               MainAxisAlignment.spaceBetween,
                  //                           crossAxisAlignment:
                  //                               CrossAxisAlignment.center,
                  //                           children: [
                  //                             Text(
                  //                               availableCategories[index],
                  //                               style:
                  //                                   heading2TextStyle.copyWith(
                  //                                 color: blueColor,
                  //                               ),
                  //                             ),
                  //                             InkWell(
                  //                               onTap: () {
                  //                                 setState(() {
                  //                                   if (selectedCategories
                  //                                       .contains(
                  //                                           availableCategories[
                  //                                               index])) {
                  //                                     selectedCategories =
                  //                                         selectedCategories
                  //                                             .where((element) =>
                  //                                                 element !=
                  //                                                 availableCategories[
                  //                                                     index])
                  //                                             .toList();
                  //                                   } else {
                  //                                     selectedCategories = [
                  //                                       ...selectedCategories,
                  //                                       availableCategories[
                  //                                           index]
                  //                                     ];
                  //                                   }
                  //                                 });
                  //                               },
                  //                               child: Container(
                  //                                 width: 15.h,
                  //                                 height: 15.h,
                  //                                 decoration: selectedCategories
                  //                                         .contains(
                  //                                             availableCategories[
                  //                                                 index])
                  //                                     ? const BoxDecoration(
                  //                                         image:
                  //                                             DecorationImage(
                  //                                           image: AssetImage(
                  //                                               'assets/icons/icon_check_blue.png'),
                  //                                         ),
                  //                                       )
                  //                                     : const BoxDecoration(
                  //                                         image:
                  //                                             DecorationImage(
                  //                                           image: AssetImage(
                  //                                               'assets/icons/icon_check_blue_inactive.png'),
                  //                                         ),
                  //                                       ),
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       );
                  //                     },
                  //                   ),
                  //                 ),
                  //                 const SizedBox(
                  //                   height: 20,
                  //                 ),
                  //                 RoundedButton(
                  //                   width: 100.w,
                  //                   height: 35.h,
                  //                   text: 'Okay',
                  //                   buttonColor: blueColor,
                  //                   textColor: whiteColor,
                  //                   onPressed: () {},
                  //                 )
                  //               ],
                  //             ),
                  //             height: 200.h,
                  //           );
                  //         }),
                  //       );
                  //     });
                  //   }),
                  //   child: Container(
                  //     width: 40.h,
                  //     height: 40.h,
                  //     padding: EdgeInsets.all(10),
                  //     decoration: BoxDecoration(
                  //       color: blueColor,
                  //       borderRadius: BorderRadius.circular(20.r),
                  //     ),
                  //     child: const Image(
                  //       image: AssetImage('assets/icons/icon_filter.png'),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
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
                    child: const Image(
                      image: AssetImage('assets/images/img_ill_edukasi.png'),
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
                          'Ruang Edukasi',
                          style: heading1BoldTextStyle.copyWith(
                            color: blueColor,
                          ),
                        ),
                        Text(
                          'Platform konten pencerdasan dan informasi oleh kementerian di BEM KM UNY',
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
            SizedBox(
              height: 30.h,
              child: ScrollConfiguration(
                behavior: CustomScroll(),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    ...availableCategories
                        .map((e) => InkWell(
                              onTap: () {
                                handleCategoryChange(e);
                              },
                              child: CategoriesButton(
                                text: e,
                                isActive: selectedCategory == e,
                              ),
                            ))
                        .toList(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            _news.isEmpty
                ? const Text('Berita tidak ditemukan')
                : ScrollConfiguration(
                    behavior: CustomScroll(),
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: _controller,
                      itemCount: _news.length,
                      itemBuilder: ((_, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: EdukasiCard(
                                imageSrc: _news[index].image,
                                title: _news[index].title,
                                content: _news[index].content,
                                type: EdukasiCardType.edu),
                          )),
                    ),
                  ),
            if (_isLoadMoreRunning == true)
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 40),
                child: Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff18345C),
                  ),
                ),
              ),
            if (_hasNextPage == false)
              Container(
                padding: const EdgeInsets.only(top: 30, bottom: 40),
                color: Colors.amber,
                child: const Center(
                  child: Text('You have fetched all of the content'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

enum EdukasiCardType {
  main,
  edu,
}

class EdukasiCard extends StatelessWidget {
  EdukasiCard({
    Key? key,
    required this.imageSrc,
    required this.title,
    required this.content,
    this.type = EdukasiCardType.main,
  }) : super(key: key);

  String imageSrc;
  String title;
  String content;

  EdukasiCardType type = EdukasiCardType.main;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final RuangEdukasiDetailArgs args = RuangEdukasiDetailArgs(
          title: title,
          content: content,
          image: imageSrc,
        );
        Get.toNamed('/edukasiDetail', arguments: args);
      },
      child: type == EdukasiCardType.main
          ? Row(
              children: [
                SizedBox(
                  width: 1.34 * 150.h,
                  child: Column(
                    children: [
                      Container(
                        height: 110.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          image: DecorationImage(
                            image: NetworkImage(imageSrc),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 40.h,
                        alignment: Alignment.topLeft,
                        child: Text(
                          title,
                          style: heading3TextStyle.copyWith(
                            color: blueColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            )
          : SizedBox(
              width: 330.w,
              height: 250.h,
              // color: blueColor,
              child: Column(
                children: [
                  Container(
                    height: 180.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: yellowColor,
                      image: DecorationImage(
                        image: NetworkImage(
                          imageSrc,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 70.h,
                    width: 330.w,
                    padding: EdgeInsets.symmetric(vertical: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: heading1MediumTextStyle.copyWith(
                            color: blueColor,
                          ),
                        ),
                      ],
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
    required this.text,
    this.isActive = false,
  }) : super(key: key);

  String text;
  bool isActive;

  @override
  State<CategoriesButton> createState() => _CategoriesButtonState();
}

class _CategoriesButtonState extends State<CategoriesButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
