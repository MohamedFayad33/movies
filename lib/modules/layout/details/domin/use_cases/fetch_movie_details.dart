import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helper/failuer.dart';
import 'package:movies_app/modules/layout/details/domin/entities/movie_details_entity.dart';
import 'package:movies_app/modules/layout/details/domin/repository/movie_details_repo.dart';

class FetchMovieDetailsUseCase {
  final MovieDetailsRepo movieDetailsRepo;

  FetchMovieDetailsUseCase({required this.movieDetailsRepo});

  Future<Either<Failuer, MovieDetailsEntity>> call(
    String endPoint,
    String movieId,
  ) async {
    return await movieDetailsRepo.fetchMovieDetails(endPoint, movieId);
  }
}
