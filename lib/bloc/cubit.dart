import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/bloc/states.dart';
import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/models/resource_model.dart';
import 'package:news_app/repo/home_repo.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeRepo repo;
  HomeCubit(this.repo) : super(HomeInitState());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<Sources> sources = [];
  List<Articles> articles = [];
  int selectedIndex = 0;

  void changeSelected(int index) {
    selectedIndex = index;
    emit(changeSelectedSource());
  }

  Future<void> getResoursec(String? categoryId) async {
    emit(HomeGetSourcesLoadingState());
    try {
      var resourceResponse = await repo.getResources(categoryId!);
      sources = resourceResponse.sources ?? [];
      emit(HomeGetSourcesSuccessState());
    } catch (e) {
      emit(HomeGetNewsErrorState(e.toString()));
    }
  }

  Future<void> getNewsData() async {
    try {
      var newsData = await repo.getNewsData(sources[selectedIndex].id!);
      articles = newsData.articles ?? [];
      emit(HomeGetNewsSuccessState());
    } catch (e) {
      emit(HomeGetNewsErrorState(e.toString()));
    }
  }
}
