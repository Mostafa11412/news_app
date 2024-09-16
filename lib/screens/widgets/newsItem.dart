// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/news_data_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  Articles articels;
  NewsItem({super.key, required this.articels});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
                errorWidget: (context, url, error) => Icon(Icons.error),
                height: 250.h,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, progress) =>
                    Center(child: CircularProgressIndicator()),
                imageUrl: articels.urlToImage ?? ''),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  articels.author ?? "",
                  style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF79828B)),
                ),
                Text(
                  articels.title ?? "",
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF42505C)),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    timeago.format(DateTime.parse(articels.publishedAt!)),
                    style: GoogleFonts.inter(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFA3A3A3)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
