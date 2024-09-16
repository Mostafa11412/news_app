class ResourceModel {
  String? status;
  List<Sources>? sources;

  ResourceModel({this.status, this.sources});

  ResourceModel.fromJson(Map<String, dynamic> json) {
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["sources"] is List) {
      sources = json["sources"] == null
          ? null
          : (json["sources"] as List).map((e) => Sources.fromJson(e)).toList();
    }
  }
}

class Sources {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Sources(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.language,
      this.country});

  Sources.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["category"] is String) {
      category = json["category"];
    }
    if (json["language"] is String) {
      language = json["language"];
    }
    if (json["country"] is String) {
      country = json["country"];
    }
  }
}
