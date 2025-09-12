import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helper/failuer.dart';
import 'package:movies_app/modules/layout/home/domin/entities/movie.dart';
import 'package:movies_app/modules/layout/home/domin/repo/movies_repo.dart';

class FetchAvailableUseCase {
  final MoviesRepo moviesRepo;

  FetchAvailableUseCase(this.moviesRepo);
  Future<Either<Failuer, List<MovieEntity>>> call() async {
    return moviesRepo.fetchAvailableNow();
  }
}
