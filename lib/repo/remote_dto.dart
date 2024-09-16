import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/models/resource_model.dart';
import 'package:news_app/repo/home_repo.dart';

class HomeRemoteDS implements HomeRepo {
  @override
  Future<NewsDataModel> getNewsData(String SourceId) async {
    Uri url = Uri.https("newsapi.org", "/v2/everything",
        {"apiKey": "6cfeb8dda9764025a9eef31472475da7", "sources": SourceId});

    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(json);
    return newsDataModel;
  }

  @override
  Future<ResourceModel> getResources(String categoryId) async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources", {
      "apiKey": "6cfeb8dda9764025a9eef31472475da7",
      "category": categoryId,
    });

    http.Response response = await http.get(url);

    var json = jsonDecode(response.body);
    ResourceModel resourceModel = ResourceModel.fromJson(json);
    return resourceModel;
  }
}
