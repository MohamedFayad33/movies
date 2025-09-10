import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helper/failuer.dart';
import 'package:movies_app/modules/auth/domain/repsitory/auth_repo.dart';

class RegisterUseCase {
  const RegisterUseCase({required this.authRepo});
  final AuthRepo authRepo;

  Future<Either<Failuer, bool>> call({
    required String endPoint,
    required Map<String, dynamic> body,
  }) {
    return authRepo.register(endPoint: endPoint, body: body);
  }
}
