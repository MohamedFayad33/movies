import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helper/failuer.dart';
import 'package:movies_app/modules/layout/home/data/data_source/remote_data_source.dart';
import 'package:movies_app/modules/layout/home/domin/entities/movie.dart';
import 'package:movies_app/modules/layout/home/domin/repo/movies_repo.dart';

class MoviesRepoImpl extends MoviesRepo {
  MoviesRepoImpl(this.movieRemoteDataSource);
  final MovieRemoteDataSource movieRemoteDataSource;

  @override
  Future<Either<Failuer, List<MovieEntity>>> fetchAvailableNow() async {
    try {
      List<MovieEntity> movies = await movieRemoteDataSource
          .fetchAvailableNow();

      return right(movies);
    } catch (e) {
      return left(ServerFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failuer, List<MovieEntity>>> fetchAction() {
    // TODO: implement fetchAction
    throw UnimplementedError();
  }
}
