// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/models/resource_model.dart';
import 'package:news_app/network/remote/apiManager.dart';
import 'package:news_app/repo/remote_dto.dart';
import 'package:news_app/screens/news_tab.dart';

class NewsScreen extends StatefulWidget {
  String catogryId;

  NewsScreen({
    super.key,
    required this.catogryId,
  });

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(HomeRemoteDS())..getResoursec(widget.catogryId),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeGetSourcesLoadingState) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Center(child: CircularProgressIndicator()),
                  );
                });
          } else if (state is HomeGetSourcesSuccessState ||
              state is changeSelectedSource) {
            HomeCubit.get(context).getNewsData();
          }
        },
        builder: (context, state) {
          if (state is HomeGetSourcesSuccessState) {
            return Expanded(
              child: NewsTab(),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
