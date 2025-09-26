import 'package:movies_app/core/api_service/api_service.dart';
import 'package:movies_app/core/di/app_di.dart';
import 'package:movies_app/modules/layout/details/data/data_source/remote_movie_details.dart';
import 'package:movies_app/modules/layout/details/data/repository/movie_detail_repo_imp.dart';
import 'package:movies_app/modules/layout/details/domin/use_cases/fetch_movie_details.dart';
import 'package:movies_app/modules/layout/details/domin/use_cases/fetch_movie_suggestion.dart';

abstract class DetailsDi {
  static void setting() async {
    sl
      ..registerLazySingleton<RemoteMovieDetailsImpl>(
        () => RemoteMovieDetailsImpl(apiService: sl.get<ApiService>()),
      )
      ..registerLazySingleton(
        () => MovieDetailRepoImp(
          remoteMovieDetails: sl.get<RemoteMovieDetailsImpl>(),
        ),
      )
      ..registerLazySingleton(
        () => FetchMovieDetailsUseCase(
          movieDetailsRepo: sl.get<MovieDetailRepoImp>(),
        ),
      )
      ..registerLazySingleton<FetchMovieSuggestionUseCase>(
        () => FetchMovieSuggestionUseCase(
          movieDetailsRepo: sl.get<MovieDetailRepoImp>(),
        ),
      );
  }
}
