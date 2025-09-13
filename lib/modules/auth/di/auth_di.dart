import 'package:movies_app/core/api_service/api_service.dart';
import 'package:movies_app/core/di/app_di.dart';
import 'package:movies_app/modules/auth/data/data_source/local_data_source.dart';
import 'package:movies_app/modules/auth/data/data_source/remote_data_source.dart';
import 'package:movies_app/modules/auth/data/repository/repository.dart';
import 'package:movies_app/modules/auth/domain/use_cases/login_use_case.dart';
import 'package:movies_app/modules/auth/domain/use_cases/register_use_case.dart';

abstract class AuthDi {
  static void setting() {
    sl
      ..registerLazySingleton<ApiService>(() => ApiService())
      ..registerLazySingleton<AuthRemoteDataSourceImpl>(
        () => AuthRemoteDataSourceImpl(sl.get<ApiService>()),
      )
      ..registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSource())
      ..registerLazySingleton<AuthRepoImpl>(
        () => AuthRepoImpl(
          authLocalDataSource: sl.get<AuthLocalDataSource>(),
          authRemoteDataSource: sl.get<AuthRemoteDataSourceImpl>(),
        ),
      )
      ..registerLazySingleton<RegisterUseCase>(
        () => RegisterUseCase(authRepo: sl.get<AuthRepoImpl>()),
      )
      ..registerLazySingleton<LoginUseCase>(
        () => LoginUseCase(authRepo: sl.get<AuthRepoImpl>()),
      );
  }
}
