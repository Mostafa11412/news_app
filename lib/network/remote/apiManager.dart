import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/models/resource_model.dart';

class Apimanager {
  static Future<NewsDataModel> searchNews(String? q) async {
    Uri url = Uri.https("newsapi.org", "/v2/everything",
        {"apiKey": "6cfeb8dda9764025a9eef31472475da7", "q": q});

    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    return NewsDataModel.fromJson(json);
  }
}
