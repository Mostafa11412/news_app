import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/news_data_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class Articlescreen extends StatefulWidget {
  static const String Route = "Articlescreen";
  Articlescreen({
    super.key,
  });

  @override
  State<Articlescreen> createState() => _ArticlescreenState();
}

class _ArticlescreenState extends State<Articlescreen> {
  Articles? article;

  @override
  Widget build(BuildContext context) {
    article = ModalRoute.of(context)!.settings.arguments as Articles;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News App!"),
        ),
        body: article == null
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Column(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        height: 250.h,
                        fit: BoxFit.fill,
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(child: CircularProgressIndicator()),
                        imageUrl: article!.urlToImage ?? ''),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article!.author ?? "",
                          style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF79828B)),
                        ),
                        Text(
                          article!.title ?? "",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF42505C)),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            timeago
                                .format(DateTime.parse(article!.publishedAt!)),
                            style: GoogleFonts.inter(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFA3A3A3)),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          article!.description ?? "",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF42505C)),
                        ),
                        Text(
                          article!.content ?? "",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF42505C)),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              
                              onPressed: () async {
                                {
                                  if (!await launchUrl(
                                      Uri.parse(article!.url!))) {
                                    throw Exception(
                                        'Could not launch ${article!.url}');
                                  }
                                }
                              },
                              child: Text(
                                "View Full Article >",
                              )),
                        )
                      ],
                    ),
                  )
                ]),
              ),
      ),
    );
  }
}
