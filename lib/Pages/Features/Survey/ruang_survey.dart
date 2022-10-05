// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Models/survey.dart';
import 'package:ruang_temu_apps/Widgets/custom_scroll.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../../../env.dart';
import '../../../themes.dart';

Future<List<Survey>> fetchSurvey() async {
  final response = await http.get(Uri.parse("$baseAPIUrl/surveys"));

  if (response.statusCode == 200) {
    Iterable l = json.decode(response.body);
    return List<Survey>.from(l.map((model) => Survey.fromJson(model)));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load survey');
  }
}

class RuangSurvey extends StatefulWidget {
  const RuangSurvey({super.key});

  @override
  State<RuangSurvey> createState() => _RuangSurveyState();
}

class _RuangSurveyState extends State<RuangSurvey> {
  late Future<List<Survey>> futureSurvey;

  @override
  void initState() {
    super.initState();
    futureSurvey = fetchSurvey();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    // double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: FeatureAppbar(
        title: 'Ruang Survey',
        iconSrc: 'assets/icons/icon_survey.png',
      ),
      body: Stack(
        children: [
          Hero(
            tag: 'assets/images/img_ill_survey.png',
            child: Container(
              height: 200.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/img_ill_survey.png'),
                ),
              ),
            ),
          ),
          ScrollConfiguration(
            behavior: CustomScroll(),
            child: ListView(
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: blueColor,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        child: Text(
                          'Ruang Survey berisi survey menarik yang dikelola oleh Kementerian Riset dan Data BEM KM UNY ',
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
                FutureBuilder<List<Survey>>(
                  future: futureSurvey,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                          children: snapshot.data
                                  ?.map(
                                    (e) => SurveyCard(
                                      title: e.name,
                                      url: e.url,
                                    ),
                                  )
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
          ),
        ],
      ),
    );
  }
}

class SurveyCard extends StatefulWidget {
  SurveyCard({Key? key, required this.title, required this.url})
      : super(key: key);

  String title;
  String url;

  @override
  State<SurveyCard> createState() => _SurveyCardState();
}

class _SurveyCardState extends State<SurveyCard> {
  //Function for Launch URL
  openUrl() async {
    await launchUrl(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: deviceWidth,
      decoration: BoxDecoration(
          color: blueColor,
          border: Border.all(
            width: 0,
            color: blueColor,
          )),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
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
                  SizedBox(
                    width: 40.h,
                    height: 40.h,
                    child: const Image(
                      image: AssetImage('assets/icons/icon_survey_light.png'),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 240.w,
                    height: 55.h,
                    child: Text(
                      widget.title,
                      style: heading2TextStyle.copyWith(
                        color: blueColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
