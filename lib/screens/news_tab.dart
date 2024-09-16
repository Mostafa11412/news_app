// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/models/resource_model.dart';
import 'package:news_app/network/remote/apiManager.dart';
import 'package:news_app/screens/articleScreen.dart';
import 'package:news_app/screens/widgets/newsItem.dart';
import 'package:news_app/screens/widgets/source_item.dart';

class NewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DefaultTabController(
          length: HomeCubit.get(context).sources.length,
          child: TabBar(
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              isScrollable: true,
              onTap: (value) {
                HomeCubit.get(context).changeSelected(value);
              },
              tabs: HomeCubit.get(context)
                  .sources
                  .map((e) => Tab(
                        child: SourceItem(
                            source: e,
                            isSelected: HomeCubit.get(context)
                                    .sources
                                    .elementAt(
                                        HomeCubit.get(context).selectedIndex) ==
                                e),
                      ))
                  .toList())),
      Expanded(
        child: ListView.builder(
          itemCount: HomeCubit.get(context).articles.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    Articlescreen.Route,
                    arguments: HomeCubit.get(context).articles[index],
                  );
                },
                child:
                    NewsItem(articels: HomeCubit.get(context).articles[index]));
          },
        ),
      )
    ]);
  }
}
