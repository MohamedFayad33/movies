import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:movies_app/core/helper/failuer.dart';
import 'package:movies_app/modules/auth/data/data_source/local_data_source.dart';
import 'package:movies_app/modules/auth/data/data_source/remote_data_source.dart';
import 'package:movies_app/modules/auth/domain/repsitory/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepoImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });
  @override
  Future<Either<Failuer, bool>> register({
    required String endPoint,
    required Map<String, dynamic> body,
  }) async {
    try {
      Response respose = await authRemoteDataSource.registerUser(
        endPoint: endPoint,
        body: body,
      );

      Map<String, dynamic> data = jsonDecode(respose.body);
      String msError = data['message'] is List
          ? data['message'][0]
          : data['message'];
      if (respose.statusCode == 200 || respose.statusCode == 201) {
        await authLocalDataSource.saveData(data['data']);
        return right(true);
      } else if (respose.statusCode == 400 ||
          respose.statusCode == 401 ||
          respose.statusCode == 403 ||
          respose.statusCode == 405 ||
          respose.statusCode == 500) {
        return left(ServerFailuer(msError));
      }
      return right(false);
    } catch (e) {
      return left(ServerFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failuer, bool>> login({
    required String endPoint,
    required Map<String, dynamic> body,
  }) async {
    try {
      Response respose = await authRemoteDataSource.registerUser(
        endPoint: endPoint,
        body: body,
      );

      Map<String, dynamic> data = jsonDecode(respose.body);
      String msError = data['message'] is List
          ? data['message'][0]
          : data['message'];
      if (respose.statusCode == 200 || respose.statusCode == 201) {
        await authLocalDataSource.saveToken(data['data']);
        return right(true);
      } else if (respose.statusCode == 400 ||
          respose.statusCode == 401 ||
          respose.statusCode == 403 ||
          respose.statusCode == 405 ||
          respose.statusCode == 500) {
        return left(ServerFailuer(msError));
      }
      return right(false);
    } catch (e) {
      return left(ServerFailuer(e.toString()));
    }
  }
}
