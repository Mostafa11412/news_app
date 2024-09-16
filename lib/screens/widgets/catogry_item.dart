// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/catogryModel.dart';

class CatogryItem extends StatelessWidget {
  Catogrymodel catogry;
  int index;
  CatogryItem({super.key, required this.catogry, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 11.h,
      width: 148.w,
      decoration: BoxDecoration(
          color: catogry.color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
            bottomLeft: index.isOdd ? Radius.zero : Radius.circular(25.r),
            bottomRight: index.isEven ? Radius.zero : Radius.circular(25.r),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/${catogry.imagePath}",
            height: 116.h,
            width: 132.w,
            fit: BoxFit.fill,
          ),
          Text(
            catogry.title ,
            style: GoogleFonts.exo(
                fontSize: 22.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
