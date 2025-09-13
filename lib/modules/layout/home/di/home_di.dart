import 'package:movies_app/core/api_service/api_service.dart';
import 'package:movies_app/core/di/app_di.dart';
import 'package:movies_app/modules/layout/home/data/data_source/remote_data_source.dart';
import 'package:movies_app/modules/layout/home/data/repo/movies_repo.dart';
import 'package:movies_app/modules/layout/home/domin/use_cases/fetch_available_use_case.dart';

abstract class HomeDi {
  static void setting() {
    sl
      ..registerLazySingleton<MovieRemoteDataSourceImp>(
        () => MovieRemoteDataSourceImp(sl.get<ApiService>()),
      )
      ..registerLazySingleton<MoviesRepoImpl>(
        () => MoviesRepoImpl(sl.get<MovieRemoteDataSourceImp>()),
      )
      ..registerLazySingleton<FetchAvailableUseCase>(
        () => FetchAvailableUseCase(sl.get<MoviesRepoImpl>()),
      );
  }
}
