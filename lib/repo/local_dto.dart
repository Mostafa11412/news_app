import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/models/resource_model.dart';
import 'package:news_app/repo/home_repo.dart';

class HomeLocalDS implements HomeRepo {
  @override
  Future<NewsDataModel> getNewsData(String SourceId) {
    // TODO: implement getNewsData
    throw UnimplementedError();
  }

  @override
  Future<ResourceModel> getResources(String categoryId) {
    // TODO: implement getResources
    throw UnimplementedError();
  }
}
