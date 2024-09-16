// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:news_app/layouts/theme.dart';
import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/network/remote/apiManager.dart';
import 'package:news_app/screens/widgets/newsItem.dart';

class SearchD extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      return FutureBuilder<NewsDataModel>(
        future: Apimanager.searchNews(query),
        builder: (BuildContext context, AsyncSnapshot<NewsDataModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("SomeThing Went Wrong",
                style: GoogleFonts.exo(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF39A552)));
          }
          if (snapshot.data == null) {
            return Text("Empty",
                style: GoogleFonts.exo(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF39A552)));
          }

          var articelsList = snapshot.data!.articles ?? [];

          return Expanded(
            child: ListView.builder(
              itemCount: articelsList.length,
              itemBuilder: (BuildContext context, int index) {
                return NewsItem(articels: articelsList[index]);
              },
            ),
          );
        },
      );
    } else {
      return Center(
          child: Text("Empty",
              style: GoogleFonts.exo(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF39A552))));
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      return FutureBuilder<NewsDataModel>(
        future: Apimanager.searchNews(query),
        builder: (BuildContext context, AsyncSnapshot<NewsDataModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("SomeThing Went Wrong",
                style: GoogleFonts.exo(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF39A552)));
          }
          if (snapshot.data == null) {
            return Text("Empty",
                style: GoogleFonts.exo(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF39A552)));
          }

          var articelsList = snapshot.data!.articles ?? [];

          return Expanded(
            child: ListView.builder(
              itemCount: articelsList.length,
              itemBuilder: (BuildContext context, int index) {
                return NewsItem(articels: articelsList[index]);
              },
            ),
          );
        },
      );
    } else {
      return Center(
          child: Text("Empty",
              style: GoogleFonts.exo(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF39A552))));
    }
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return MyTheme.copyWith(
        appBarTheme: AppBarTheme(toolbarHeight: 90.h),
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: Theme.of(context).textTheme.titleLarge,
            hintStyle: Theme.of(context).textTheme.titleLarge,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide:
                  BorderSide(color: Colors.black), // Adjust the width as needed
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide(color: Colors.white),
            )));
  }
}
