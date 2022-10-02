// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Models/call_center.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:ruang_temu_apps/env.dart';
import 'package:ruang_temu_apps/themes.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

Future<List<Callcenter>> fetchCallcenter() async {
  final response = await http.get(Uri.parse("$baseAPIUrl/callcenters"));

  if (response.statusCode == 200) {
    Iterable l = json.decode(response.body);
    return List<Callcenter>.from(l.map((model) => Callcenter.fromJson(model)));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load callcenter');
  }
}

class HalounyPage extends StatefulWidget {
  const HalounyPage({super.key});

  @override
  State<HalounyPage> createState() => _HalounyPageState();
}

class _HalounyPageState extends State<HalounyPage> {
  late Future<List<Callcenter>> futureCallcenter;

  @override
  void initState() {
    super.initState();
    futureCallcenter = fetchCallcenter();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: FeatureAppbar(
        title: 'HaloUNY!',
        iconSrc: 'assets/icons/icon_phone.png',
      ),
      body: Stack(
        children: [
          Hero(
            tag: 'assets/images/img_ill_halouny.png',
            child: Container(
              height: 200.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/img_ill_halouny.png'),
                ),
              ),
            ),
          ),
          ListView(
            children: [
              SizedBox(
                // height: deviceHeight - 170.h,
                height: 200.h,
              ),
              Container(
                height: 70.h,
                // height: (listLength < 4) ? deviceHeight - 200.h : 100.h,
                decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                  border: Border.all(
                    width: 0,
                    color: blueColor,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 70.w,
                      height: 3.h,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    Container(
                      color: blueColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                      child: Text(
                        'HalloUNY! adalah Call Center untuk menerima layanan\naduan mengenai masalah di lingkungan kampus.',
                        style: heading3TextStyle.copyWith(
                          color: whiteColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              //card builder
              FutureBuilder<List<Callcenter>>(
                future: futureCallcenter,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                        children: snapshot.data
                                ?.map((e) => CallCenterCard(
                                      imgSrc: e.logoUrl ??
                                          'assets/logos/logo_advokesma.png',
                                      title: e.name,
                                      subtitle: e.description,
                                      // url: e.url,
                                      // url: "https:www.uny.ac.id",
                                      url: e.url,
                                    ))
                                .toList() ??
                            []);
                  } else if (!snapshot.hasData) {
                    return Container(
                      width: deviceWidth,
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
              Container(
                width: deviceWidth,
                height: 100.h,
                decoration: BoxDecoration(
                  color: blueColor,
                  border: Border.all(
                    width: 0,
                    color: blueColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CallCenterCard extends StatefulWidget {
  CallCenterCard({
    Key? key,
    required this.imgSrc,
    required this.title,
    required this.subtitle,
    required this.url,
  }) : super(key: key);
  String imgSrc;
  String title;
  String subtitle;
  String url;

  @override
  State<CallCenterCard> createState() => _CallCenterCardState();
}

class _CallCenterCardState extends State<CallCenterCard> {
  //Function for Launch URL
  openUrl() async {
    await launchUrl(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.topCenter,
      width: deviceWidth,
      height: 0.45 * 320.w,
      decoration: BoxDecoration(
        color: blueColor,
        border: Border.all(
          width: 0,
          color: blueColor,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          openUrl();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: 320.w,
              height: 0.375 * 320.w,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 70.w,
                    child: Image(
                      image: AssetImage(widget.imgSrc),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 220.w,
                        child: Text(
                          widget.title,
                          style: heading1BoldTextStyle.copyWith(
                            color: blueColor,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 220.w,
                        child: Text(
                          widget.subtitle,
                          style: heading4TextStyle.copyWith(
                            color: blueColor,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
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
