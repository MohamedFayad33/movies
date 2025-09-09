import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helper/failuer.dart';

abstract class AuthRepo {
  Future<Either<Failuer, bool>> register({
    required String endPoint,
    required Map<String, dynamic> body,
  });

  Future<Either<Failuer, bool>> login({
    required String endPoint,
    required Map<String, dynamic> body,
  });
}
