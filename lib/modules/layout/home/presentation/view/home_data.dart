import 'package:movies_app/core/constant/assets/assets.dart';

abstract class HomeData {
  static final List<Map<String, String>> featuredMovies = [
    {"title": "1917", "image": Assets.film1, "rating": "7.7"},
    {"title": "Captain America", "image": Assets.film2, "rating": "7.7",},
    {"title": "Captain Marvel", "image": Assets.film3, "rating": "7.7",},
  ];


  static final List<Map<String, String>> actionMovies = [
    {"title": "The Dark Knight", "image": Assets.poster1, "rating": "7.7",},
    {"title": "Black Widow", "image": Assets.poster2, "rating": "7.7",},
    {"title": "Captain America", "image":Assets.poster3, "rating": "7.7",},
  ];


}