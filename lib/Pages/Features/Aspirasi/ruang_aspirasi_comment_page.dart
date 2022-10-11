import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ruang_temu_apps/Models/aspirasi_comment.dart';
import 'package:ruang_temu_apps/Widgets/custom_scroll.dart';
import 'package:ruang_temu_apps/Widgets/dialog_box.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:ruang_temu_apps/Widgets/rounded_button.dart';
import 'package:ruang_temu_apps/Widgets/rounded_button_border.dart';
import 'package:ruang_temu_apps/env.dart';
import 'package:ruang_temu_apps/http_client.dart';
import 'package:ruang_temu_apps/themes.dart';

class RuangAspirasiCommentPage extends StatefulWidget {
  int aspirationId;
  String name;
  String content;
  String? imgSrc;
  int aspirasiCommentCount = 0;

  RuangAspirasiCommentPage({
    super.key,
    required this.aspirationId,
    required this.name,
    required this.content,
    required this.imgSrc,
    required this.aspirasiCommentCount,
  });

  @override
  State<RuangAspirasiCommentPage> createState() =>
      _RuangAspirasiCommentPageState();
}

class _RuangAspirasiCommentPageState extends State<RuangAspirasiCommentPage> {
  late Future<List<AspirasiComment>> futureAspirasiComment;
  late ScrollController _controller;

  int _page = 0;
  final int _limit = 10;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  List _posts = [];

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    print(
        "$baseAPIUrl/aspirations/${widget.aspirationId}/comments?per_page=10&page=$_page");
    final res = await httpClient.get(
        "$baseAPIUrl/aspirations/${widget.aspirationId}/comments?limit=$_limit&page=$_page");

    if (res.statusCode == 200) {
      setState(() {
        Map<String, dynamic> m = json.decode(res.body);
        print(m);
        Iterable l = m['data'];
        _posts = List<AspirasiComment>.from(
            l.map((model) => AspirasiComment.fromJson(model)));
      });
    } else {
      throw Exception('Failed to load comment on first');
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
          "$baseAPIUrl/aspirations/${widget.aspirationId}/comments?per_page=10&page=$_page");

      if (res.statusCode == 200) {
        Map<String, dynamic> m = json.decode(res.body);
        String? nextPageUrl = m['next_page_url'];

        setState(() {
          _hasNextPage = nextPageUrl != null;
        });

        Iterable l = m['data'];
        final List fetchedPosts = List<AspirasiComment>.from(
            l.map((model) => AspirasiComment.fromJson(model)));
        if (fetchedPosts.isNotEmpty) {
          setState(() {
            _posts.addAll(fetchedPosts);
          });
        } else {
          // This means there is no more data
          // and therefore, we will not send another GET request
          setState(() {
            _hasNextPage = false;
          });
        }
      } else {
        throw Exception('Failed to load comment on next');
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    bool isCheckedUjaran = false;
    bool isCheckedSpam = false;
    return Scaffold(
      appBar: FeatureAppbar(
        title: 'Ruang Aspirasi',
        iconSrc: 'assets/icons/icon_mail.png',
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return DialogBox(
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/img_male_avatar.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 180.w,
                              height: 35.h,
                              child: Text(
                                "Eka Permana",
                                style: heading1MediumTextStyle.copyWith(
                                  color: blueColor,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 110.h,
                          child: TextField(
                            style: heading1MediumTextStyle.copyWith(
                              color: blueColor,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: heading1MediumTextStyle.copyWith(
                                color: blueColor.withOpacity(0.5),
                              ),
                              hintText: 'Ketik Komentar Anda..',
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RoundedButtonBorder(
                              width: 90.w,
                              height: 30.h,
                              text: "Batal",
                              borderColor: blueColor,
                              borderWidth: 1,
                              textColor: blueColor,
                              onPressed: () {
                                Get.back();
                              },
                            ),
                            RoundedButton(
                              width: 90.w,
                              height: 30.h,
                              text: "Kirim",
                              buttonColor: blueColor,
                              textColor: whiteColor,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                    height: 200.h,
                  );
                });
          });
        },
        backgroundColor: blueColor,
        child: const SizedBox(
          width: 30,
          height: 30,
          child: Image(
            image: AssetImage('assets/icons/icon_comment_white.png'),
          ),
        ),
      ),
      body: Container(
        child: ScrollConfiguration(
          behavior: CustomScroll(),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(
                  10.w,
                ),
                width: deviceWidth,
                color: yellowColor,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.imgSrc == null
                            ? CircleAvatar(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/img_male_avatar.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            : CircleAvatar(
                                backgroundImage: NetworkImage(widget.imgSrc!),
                                backgroundColor: yellowColor,
                              ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 250.w,
                          height: 35.h,
                          child: Text(
                            widget.name,
                            style: heading1MediumTextStyle.copyWith(
                              color: blueColor,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return DialogBox(
                                      widget: Column(
                                        children: [
                                          Text(
                                            "Laporkan Komentar",
                                            style: heading1MediumTextStyle
                                                .copyWith(
                                              color: blueColor,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                            // color: yellowColor,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Spam',
                                                  style: heading2TextStyle
                                                      .copyWith(
                                                    color: blueColor,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    //   print('Tapped');
                                                    //   isCheckedKampus =
                                                    //       !isCheckedKampus;
                                                    //   print(
                                                    //       isCheckedKampus);
                                                    // });
                                                  },
                                                  child: Container(
                                                    width: 15.h,
                                                    height: 15.h,
                                                    decoration: isCheckedSpam
                                                        ? const BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/icons/icon_check_blue.png'),
                                                            ),
                                                          )
                                                        : const BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/icons/icon_check_blue_inactive.png'),
                                                            ),
                                                          ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                            // color: yellowColor,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Ujaran kebencian',
                                                  style: heading2TextStyle
                                                      .copyWith(
                                                    color: blueColor,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    // setState(() {
                                                    //   isCheckedNasional =
                                                    //       !isCheckedNasional;
                                                    //   print(
                                                    //       isCheckedNasional);
                                                    // });
                                                  },
                                                  child: SizedBox(
                                                    width: 15.h,
                                                    height: 15.h,
                                                    child: isCheckedUjaran
                                                        ? const Image(
                                                            image: AssetImage(
                                                                'assets/icons/icon_check_blue.png'),
                                                          )
                                                        : const Image(
                                                            image: AssetImage(
                                                                'assets/icons/icon_check_blue_inactive.png'),
                                                          ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              RoundedButtonBorder(
                                                width: 90.w,
                                                height: 30.h,
                                                text: "Batal",
                                                borderColor: blueColor,
                                                borderWidth: 1,
                                                textColor: blueColor,
                                                onPressed: () {
                                                  Get.back();
                                                },
                                              ),
                                              RoundedButton(
                                                width: 130.w,
                                                height: 30.h,
                                                text: "Laporkan",
                                                buttonColor: blueColor,
                                                textColor: whiteColor,
                                                onPressed: () {},
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      height: 170.h,
                                    );
                                  });
                            });
                          },
                          icon: Icon(
                            Icons.more_vert,
                            color: blueColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      // color: blueColor,
                      width: 350.w,
                      child: Text(
                        widget.content,
                        // "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        style: heading2TextStyle.copyWith(
                          color: blueColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 999999,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: deviceWidth,
                height: 1.h,
                color: blueColor,
              ),
              Container(
                padding: EdgeInsets.all(
                  10.w,
                ),
                height: 40.h,
                width: deviceWidth,
                color: yellowColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.aspirasiCommentCount} Komentar',
                      style: heading3TextStyle.copyWith(
                        color: blueColor,
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 25.h,
                        height: 25.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icons/icon_comment.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: deviceWidth,
                height: 1.h,
                color: blueColor,
              ),

              //Card
              // CommentCard(deviceWidth: deviceWidth),
              _isFirstLoadRunning
                  ? const Center(
                      child:
                          CircularProgressIndicator(color: Color(0xff18345C)))
                  : Expanded(
                      child: ScrollConfiguration(
                        behavior: CustomScroll(),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _controller,
                          itemCount: _posts.length,
                          itemBuilder: ((_, index) => CommentCard(
                                deviceWidth: deviceWidth,
                                id: _posts[index].id,
                                name: _posts[index].user['name'],
                                comment: _posts[index].comment,
                                imgSrc: _posts[index].user['avatar'],
                              )),
                        ),
                      ),
                    ),

              //sized box for extra space
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  CommentCard({
    Key? key,
    required this.deviceWidth,
    required this.id,
    required this.name,
    required this.comment,
    required this.imgSrc,
  }) : super(key: key);

  final double deviceWidth;
  int id;
  String name;
  String comment;
  String imgSrc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(
            10.w,
          ),
          width: deviceWidth,
          color: whiteColor,
          child: Column(
            children: [
              Row(
                children: [
                  // imgSrc == null
                  //     ? CircleAvatar(
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //             image: DecorationImage(
                  //               image: AssetImage(
                  //                 'assets/images/img_male_avatar.png',
                  //               ),
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //         ),
                  //       )
                  CircleAvatar(
                    backgroundImage: NetworkImage(imgSrc),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 300.w,
                    height: 35.h,
                    child: Text(
                      // "Johan Brodi",
                      name,
                      style: heading1MediumTextStyle.copyWith(
                        color: blueColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 45.w,
                ),
                width: 350.w,
                child: Text(
                  comment,
                  // "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  style: heading2TextStyle.copyWith(
                    color: blueColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 999999,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: deviceWidth,
          height: 1.w,
          color: blueColor,
        ),
      ],
    );
  }
}
