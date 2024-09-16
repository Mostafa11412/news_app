import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/models/resource_model.dart';

abstract class HomeRepo {
  Future<ResourceModel> getResources(String categoryId);
  Future<NewsDataModel> getNewsData(String SourceId);
}
