// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/catogryModel.dart';
import 'package:news_app/screens/widgets/catogry_item.dart';

class Catogryscreen extends StatelessWidget {
  Function onClicked;
  Catogryscreen({super.key, required this.onClicked});
  var catogries = Catogrymodel.getCatogries();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Text(
              "Pick Your Catogery",
              style: GoogleFonts.poppins(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF4F5A69)),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 27,
                mainAxisSpacing: 20,
                mainAxisExtent: 190,
              ),
              itemCount: catogries.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {
                      onClicked(catogries[index]);
                    },
                    child:
                        CatogryItem(catogry: catogries[index], index: index));
              },
            ),
          ),
        ],
      ),
    );
  }
}
