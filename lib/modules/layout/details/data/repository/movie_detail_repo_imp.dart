import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:movies_app/core/helper/failuer.dart';
import 'package:movies_app/modules/layout/details/data/data_source/remote_movie_details.dart';
import 'package:movies_app/modules/layout/details/data/models/movie_details/movie_details.dart';
import 'package:movies_app/modules/layout/details/data/models/movie_suggetion/movie_suggestion.dart';
import 'package:movies_app/modules/layout/details/domin/entities/movie_details_entity.dart';
import 'package:movies_app/modules/layout/details/domin/entities/movie_suggestions_entity.dart';
import 'package:movies_app/modules/layout/details/domin/repository/movie_details_repo.dart';

class MovieDetailRepoImp implements MovieDetailsRepo {
  final RemoteMovieDetails remoteMovieDetails;

  MovieDetailRepoImp({required this.remoteMovieDetails});
  @override
  Future<Either<Failuer, MovieDetailsEntity>> fetchMovieDetails(
    String endPoint,
    String movieId,
  ) async {
    try {
      Response response = await remoteMovieDetails.getMovieDetails(
        endPoint,
        movieId,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        MovieDetailsEntity myData = MovieDetails.fromJson(
          data['data']['movie'],
        );
        return right(myData);
      } else if (response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 403 ||
          response.statusCode == 405 ||
          response.statusCode == 500) {
        return left(ServerFailuer('Some thing is Error Please try later'));
      }
    } catch (e) {
      return left(ServerFailuer(e.toString()));
    }
    return Left(ServerFailuer('Some thing is Error Please try later'));
  }

  @override
  Future<Either<Failuer, List<MovieSuggestionsEntity>>> fetchMovieSuggestions(
    String endPoint,
    String movieId,
  ) async {
    List<MovieSuggestionsEntity> movies = [];
    try {
      Response response = await remoteMovieDetails.getMovieSuggestions(
        endPoint,
        movieId,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        List<dynamic> myMovies = data['data']['movies'];
        for (var movie in myMovies) {
          movies.add(MovieSuggestionModel.fromJson(movie));
        }

        return right(movies);
      } else if (response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 403 ||
          response.statusCode == 405 ||
          response.statusCode == 500) {
        return left(ServerFailuer('Some thing is Error Please try later'));
      }
    } catch (e) {
      return left(ServerFailuer(e.toString()));
    }
    return Left(ServerFailuer('Some thing is Error Please try later'));
  }
}
