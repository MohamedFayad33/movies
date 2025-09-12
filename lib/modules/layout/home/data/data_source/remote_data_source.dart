import 'dart:convert';

import 'package:http/src/response.dart';
import 'package:movies_app/core/api_service/api_service.dart';
import 'package:movies_app/modules/layout/home/data/models/movie_model/movie_model.dart';
import 'package:movies_app/modules/layout/home/domin/entities/movie.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieEntity>> fetchAvailableNow();
  Future<List<MovieEntity>> fetchAction();
}

class MovieRemoteDataSourceImp extends MovieRemoteDataSource {
  final ApiService apiService;

  MovieRemoteDataSourceImp(this.apiService);

  @override
  Future<List<MovieEntity>> fetchAvailableNow() async {
    List<MovieEntity> movies = [];
    Response respo = await apiService.getMovies();
    Map<String, dynamic> data = jsonDecode(respo.body);
    for (var movie in data['data']['movies']) {
      movies.add(MovieModel.fromJson(movie));
    }
    return movies;
  }

  @override
  Future<List<MovieEntity>> fetchAction() {
    // TODO: implement fetchAction
    throw UnimplementedError();
  }
}
