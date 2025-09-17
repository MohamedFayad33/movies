import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helper/failuer.dart';
import 'package:movies_app/modules/layout/details/domin/entities/movie_details_entity.dart';

abstract class MovieDetailsRepo {
  Future<Either<Failuer, MovieDetailsEntity>> fetchMovieDetails(
    String endPoint,
    String movieId,
  );
}
