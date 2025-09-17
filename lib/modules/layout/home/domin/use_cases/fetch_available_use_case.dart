import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helper/failuer.dart';
import 'package:movies_app/modules/layout/home/domin/entities/movie.dart';
import 'package:movies_app/modules/layout/home/domin/repo/home_movies_repo.dart';

class FetchAvailableUseCase {
  final HomeMoviesRepo moviesRepo;

  FetchAvailableUseCase(this.moviesRepo);
  Future<Either<Failuer, List<MovieEntity>>> call() async {
    return moviesRepo.fetchAvailableNow();
  }
}
