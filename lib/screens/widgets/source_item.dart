// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/resource_model.dart';

class SourceItem extends StatelessWidget {
  Sources source;
  bool isSelected;
  SourceItem({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: isSelected ? Color(0xFF39A552) : Colors.white,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: Color(0xFF39A552))),
      child: Text(
        source.name!,
        style: GoogleFonts.exo(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: isSelected ? Colors.white : Color(0xFF39A552)),
      ),
    );
  }
}
