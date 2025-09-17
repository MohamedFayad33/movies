import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helper/failuer.dart';
import 'package:movies_app/modules/layout/home/domin/entities/movie.dart';

abstract class HomeMoviesRepo {
  Future<Either<Failuer, List<MovieEntity>>> fetchAvailableNow();
  Future<Either<Failuer, List<MovieEntity>>> fetchAction();
}
