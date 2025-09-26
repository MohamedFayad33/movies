import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helper/failuer.dart';
import 'package:movies_app/modules/layout/details/data/repository/movie_detail_repo_imp.dart';
import 'package:movies_app/modules/layout/details/domin/entities/movie_suggestions_entity.dart';

class FetchMovieSuggestionUseCase {
  final MovieDetailRepoImp movieDetailsRepo;

  FetchMovieSuggestionUseCase({required this.movieDetailsRepo});

  Future<Either<Failuer, List<MovieSuggestionsEntity>>> call(
    String endPoint,
    String movieId,
  ) async {
    return await movieDetailsRepo.fetchMovieSuggestions(endPoint, movieId);
  }
}
