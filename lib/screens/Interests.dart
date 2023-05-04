import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Interests extends StatefulWidget {
  const Interests({super.key});

  @override
  State<Interests> createState() => _InterestsState();
}

class _InterestsState extends State<Interests>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  List<String> _interests = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E0B1F),
        elevation: 0.0,
      ),
      backgroundColor: const Color(0xFF0E0B1F),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                SizedBox(
                  width: 250.w,
                  child: Text(
                    "Add your interests",
                    style: GoogleFonts.roboto(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  width: 227.w,
                  child: Text(
                    "To help you connect with right people kindly enter all the interests",
                    style: GoogleFonts.roboto(
                        color: const Color(0xFF8D92A3),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Wrap(
                  spacing: 8,
                  children: [
                    for (var interest in _interests)
                      Chip(
                        label: Text(interest),
                        deleteIcon: Icon(Icons.clear),
                        onDeleted: () {
                          setState(() {
                            _interests.remove(interest);
                          });
                        },
                      ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Enter your interests',
                          hintStyle: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF9F9F9F),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9F9F9F))),
                        ),
                        onSubmitted: (value) {
                          setState(() {
                            _interests.add(value);
                            _controller.clear();
                          });
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _interests.add(_controller.text);
                          _controller.clear();
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.h,
                ),
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 46.h,
                    width: 295.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/");
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFFCBFB5E))),
                      child: Text(
                        "CONTINUE",
                        style: GoogleFonts.roboto(
                            color: const Color(0xFF20242F),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
