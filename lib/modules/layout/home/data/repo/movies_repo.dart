import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:movies_app/core/helper/failuer.dart';
import 'package:movies_app/modules/layout/home/data/data_source/remote_data_source.dart';
import 'package:movies_app/modules/layout/home/data/models/movie_model/movie_model.dart';
import 'package:movies_app/modules/layout/home/domin/entities/movie.dart';
import 'package:movies_app/modules/layout/home/domin/repo/home_movies_repo.dart';

class HomeMoviesRepoImpl extends HomeMoviesRepo {
  HomeMoviesRepoImpl(this.movieRemoteDataSource);
  final MovieRemoteDataSource movieRemoteDataSource;

  @override
  Future<Either<Failuer, List<MovieEntity>>> fetchAvailableNow() async {
    List<MovieEntity> myMovies = [];
    try {
      Response response = await movieRemoteDataSource.fetchAvailableNow();
      Map<String, dynamic> dataMovies = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        for (var movie in dataMovies['data']['movies']) {
          myMovies.add(MovieModel.fromJson(movie));
        }
        return right(myMovies);
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
    return left(ServerFailuer('Some thing is Error Please try later'));
  }

  @override
  Future<Either<Failuer, List<MovieEntity>>> fetchAction() {
    // TODO: implement fetchAction
    throw UnimplementedError();
  }
}
