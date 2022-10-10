import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Models/informations.dart';
import 'package:ruang_temu_apps/Widgets/custom_scroll.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:get/get.dart';
import 'package:ruang_temu_apps/env.dart';
import 'package:ruang_temu_apps/http_client.dart';
import 'package:ruang_temu_apps/themes.dart';
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';

Future<List<Information>> fetchInformation() async {
  final response = await httpClient.get("$baseAPIUrl/informations");

  if (response.statusCode == 200) {
    Iterable l = json.decode(response.body);
    return List<Information>.from(
        l.map((model) => Information.fromJson(model)));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Information');
  }
}

class RuangInfo extends StatefulWidget {
  const RuangInfo({super.key});

  @override
  State<RuangInfo> createState() => _RuangInfoState();
}

class _RuangInfoState extends State<RuangInfo> {
  late Future<List<Information>> futureInformation;

  @override
  void initState() {
    super.initState();
    futureInformation = fetchInformation();
  }

  @override
  Widget build(BuildContext context) {
    // double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: FeatureAppbar(
        title: 'Ruang Info',
        iconSrc: 'assets/icons/icon_info.png',
      ),
      body: Stack(
        children: [
          Hero(
            tag: 'assets/images/img_ill_info.png',
            child: Container(
              height: 200.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/img_ill_info_v2.png'),
                ),
              ),
            ),
          ),
          ScrollConfiguration(
            behavior: CustomScroll(),
            child: ListView(
              children: [
                Container(
                  height: 200.h,
                ),
                Container(
                  // height: deviceHeight - 200.h,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: blueColor,
                  ),
                  child: FutureBuilder<List<Information>>(
                    future: futureInformation,
                    builder: (context, snapshot) {
                      print(snapshot.data);
                      if (snapshot.hasData && snapshot.data != null) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              width: 50.w,
                              height: 2.h,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              'Ruang Info menyediakan informasi mengenai lomba, beasiswa, dan internship bagi mahasiswa UNY',
                              style: heading3TextStyle.copyWith(
                                color: whiteColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ...?snapshot.data
                                ?.map((e) => InfoCard(
                                      url: e.canonicalUrl,
                                      // iconSrc: 'assets/icons/icon_calendar.png',
                                      title: e.postTitle,
                                    ))
                                .toList()
                          ],
                        );
                      } else if (!snapshot.hasData) {
                        return Container(
                          width: Get.width,
                          height: 300.h,
                          decoration: BoxDecoration(
                            color: blueColor,
                            border: Border.all(
                              width: 0,
                              color: blueColor,
                            ),
                          ),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      // By default, show a loading spinner.
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    },
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

class InfoCard extends StatelessWidget {
  InfoCard({
    Key? key,
    required this.url,
    // required this.iconSrc,
    required this.title,
  }) : super(key: key);

  String url;
  // String iconSrc;
  String title;
  openUrl() async {
    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Get.toNamed(id);
            openUrl();
          },
          child: Container(
            padding: EdgeInsets.all(10.w),
            width: 320.w,
            height: 75.h,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              children: [
                // SizedBox(
                //   width: 40.h,
                //   height: 40.h,
                //   child: Image(
                //     image: AssetImage(iconSrc),
                //   ),
                // ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  title,
                  style: heading2TextStyle.copyWith(
                    color: blueColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
