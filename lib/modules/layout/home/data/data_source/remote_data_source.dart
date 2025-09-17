import 'package:http/http.dart';
import 'package:movies_app/core/api_service/api_endpoint.dart';
import 'package:movies_app/core/api_service/api_service.dart';

abstract class MovieRemoteDataSource {
  Future<Response> fetchAvailableNow();
  Future<Response> fetchAction();
}

class MovieRemoteDataSourceImp implements MovieRemoteDataSource {
  final ApiService apiService;

  MovieRemoteDataSourceImp(this.apiService);

  @override
  Future<Response> fetchAvailableNow() async {
    Response respo = await apiService.getMovies(ApiEndpoint.listOfMovies);
    return respo;
  }

  @override
  Future<Response> fetchAction() {
    // TODO: implement fetchAction
    throw UnimplementedError();
  }
}
