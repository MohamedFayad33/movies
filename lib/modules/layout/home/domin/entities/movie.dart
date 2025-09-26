class MovieEntity {
  num? idMovie;
  String? titleMovie;
  num? ratingMovie;
  String? imageUrl;
  List<dynamic>? genresMovie;

  MovieEntity({
    required this.idMovie,
    required this.titleMovie,
    required this.imageUrl,
    required this.ratingMovie,
    required this.genresMovie,
  });
}
