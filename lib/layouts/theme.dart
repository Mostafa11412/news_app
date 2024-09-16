import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData MyTheme = ThemeData(
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: Color(0xFF39A552)),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xFF39A552),
      // backgroundColor: Colors.red,
      titleTextStyle: GoogleFonts.exo(
          fontSize: 22.sp, fontWeight: FontWeight.w700, color: Colors.white),
      toolbarHeight: 67.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(40.r),
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 40,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.exo(
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          color: Color(0xFF39A552)),
    ));
