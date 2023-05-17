import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Home.dart';

class VideoSet extends StatefulWidget {
  const VideoSet({super.key});

  @override
  State<VideoSet> createState() => _VideoSetState();
}

class _VideoSetState extends State<VideoSet> {
  List<String> interests = [];
  bool isError = false;
  late String errMsg;
  late Timer timer;

  TextEditingController _interestController = TextEditingController();

  void _addInterest(String interest) {
    if (interests.length < 3) {
      setState(() {
        interests.add(interest);
        _interestController.clear();
      });
    } else {
      setState(() {
        isError = true;
        errMsg = "You can enter 3 interests only";
      });
      Timer(const Duration(seconds: 3), () {
        setState(() {
          isError = false;
        });
      });
    }
  }

  void _removeInterest(String interest) {
    setState(() {
      interests.remove(interest);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Video Chat",
          style: GoogleFonts.nunito(
              fontSize: 36.sp,
              fontWeight: FontWeight.w800,
              color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color(0xFF0E0B1F),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 168.h,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                    "./assets/images/videoChatAvatar.png",
                    height: 168.h,
                  )
                ]),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Add your interests",
                style: GoogleFonts.roboto(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20.h,
              ),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: interests.map((String interest) {
                  return Chip(
                    label: Text(interest),
                  );
                }).toList(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _interestController,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color.fromRGBO(
                                        139, 139, 139, 0.26))),
                            labelText: 'Add Interest',
                            errorText: isError ? errMsg : null,
                            labelStyle: GoogleFonts.roboto(
                                fontSize: 13.sp,
                                color: const Color(0xFF979797),
                                fontWeight: FontWeight.normal)),
                        onFieldSubmitted: (value) {
                          _addInterest(value);
                        },
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      "${interests.length}/3",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 35.h,
                    width: 106.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFE90818))),
                      child: Text(
                        "Auto Join",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 15.sp),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/videocall");
                      },
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                    width: 106.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF14ADD9))),
                      child: Text(
                        "Manual",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 15.sp),
                      ),
                      
                      onPressed: () {
                        if (interests.length > 0) {
                          Navigator.pushNamed(context, "/videocall");
                        } else {
                          setState(() {
                            errMsg =
                                "Kindly enter interests for manual matching";
                            isError = true;
                          });
                          Timer(const Duration(seconds: 3), () {
                            setState(() {
                              isError = false;
                            });
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Note :",
                      style: GoogleFonts.roboto(
                          fontSize: 13.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Column(children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "1.",
                              style: GoogleFonts.roboto(
                                  fontSize: 13.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Text(
                                "Manual Join makes video call with interests  that you have added.",
                                style: GoogleFonts.roboto(
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "2.",
                              style: GoogleFonts.roboto(
                                  fontSize: 13.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Text(
                                "Auto join connects you with same interests that you have added in your profile.",
                                style: GoogleFonts.roboto(
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        )
                      ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: Color(0xFF0E0B1F),
        child: SizedBox(
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: SizedBox(
                    height: 40.h,
                    child: Icon(Icons.home,
                        size: 30.h, color: const Color(0xFFFFFFFF))),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/",
                  );
                },
              ),
              GestureDetector(
                child: SizedBox(
                    height: 40.h,
                    child: Icon(Icons.videocam_rounded,
                        size: 30.h, color: const Color(0xFF1EA7D7))),
                onTap: () {
                  //Navigate to Video Call
                  Navigator.pushNamed(
                    context,
                    "/videoset",
                  );
                },
              ),
              GestureDetector(
                child: SizedBox(
                    height: 40.h,
                    child: Icon(Icons.add_circle_rounded,
                        size: 30.h, color: const Color(0xFFFFFFFF))),
                onTap: () {
                  //Navigate to Add tiktok
                },
              ),
              GestureDetector(
                child: SizedBox(
                    height: 40.h,
                    child: Icon(Icons.chat_bubble,
                        size: 30.h, color: const Color(0xFFFFFFFF))),
                onTap: () {
                  //Navigate to chat
                },
              ),
              GestureDetector(
                child: SizedBox(
                    height: 40.h,
                    child: Icon(Icons.account_circle,
                        size: 30.h, color: const Color(0xFFFFFFFF))),
                onTap: () {
                  //Navigate to Account section
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}