import 'package:http/http.dart' as http;
import 'package:movies_app/core/api_service/api_service.dart';

abstract class AuthRemoteDataSource {
  Future<http.Response> registerUser({
    required String endPoint,
    required Map<String, dynamic> body,
  });
  Future<http.Response> loginUser({
    required String endPoint,
    required Map<String, dynamic> body,
  });
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this.apiService);
  final ApiService apiService;

  @override
  Future<http.Response> registerUser({
    required String endPoint,
    required Map<String, dynamic> body,
  }) async {
    http.Response resresponse = await apiService.auth(
      endPoint: endPoint,
      body: body,
    );
    return resresponse;
  }

  @override
  Future<http.Response> loginUser({
    required String endPoint,
    required Map<String, dynamic> body,
  }) async {
    http.Response resresponse = await apiService.auth(
      endPoint: endPoint,
      body: body,
    );
    return resresponse;
  }
}
