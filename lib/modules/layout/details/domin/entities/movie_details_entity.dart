class MovieDetailsEntity {
  final num movieId;
  final String? movieTitle;
  final num? movieYear;
  final num? movieRating;
  final num? movieRuntime;
  final num? movieLikeCount;
  final String? movieImage;
  final List<dynamic>? movieGenres;

  MovieDetailsEntity({
    required this.movieId,
    required this.movieTitle,
    required this.movieYear,
    required this.movieRating,
    required this.movieRuntime,
    required this.movieLikeCount,
    required this.movieImage,
    required this.movieGenres,
  });
}

class Genres {}
