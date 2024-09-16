// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerTab extends StatelessWidget {
  Function onClick;
  DrawerTab({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Color(0xFF39A552),
            height: 110.h,
            child: Center(
              child: Text(
                "News App!",
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    "Catogries",
                    style: GoogleFonts.poppins(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF303030)),
                  ),
                  leading: Icon(
                    Icons.list_rounded,
                    size: 40.sp,
                    color: Color(0xFF303030),
                  ),
                  onTap: () {
                    onClick();
                  },
                ),
                ListTile(
                  title: Text(
                    "Settings",
                    style: GoogleFonts.poppins(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF303030)),
                  ),
                  leading: Icon(
                    Icons.settings,
                    size: 40.sp,
                    color: Color(0xFF303030),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
