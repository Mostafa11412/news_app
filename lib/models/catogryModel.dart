// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Catogrymodel {
  String id;
  String title;
  String imagePath;
  Color? color;
  Catogrymodel(
    this.id,
    this.title,
    this.imagePath,
    this.color,
  );
  static List<Catogrymodel> getCatogries() {
    return [
      Catogrymodel("sports", "Sports", "ball.png", Color(0xFFC91C22)),
      Catogrymodel(
        "general",
        "Politics",
        "Politics.png",
        Color(0xFF003E90),
      ),
      Catogrymodel(
        "health",
        "Health",
        "health.png",
        Color(0xFFED1E79),
      ),
      Catogrymodel(
        "business",
        "bussines",
        "bussines.png",
        Color(0xFFCF7E48),
      ),
      Catogrymodel(
        "technology",
        "Enviroment",
        "environment.png",
        Color(0xFF4882CF),
      ),
      Catogrymodel(
        "science",
        "Science",
        "science.png",
        Color(0xFFF2D352),
      ),
    ];
  }
}
