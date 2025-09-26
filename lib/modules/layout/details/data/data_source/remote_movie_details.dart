import 'package:http/http.dart';
import 'package:movies_app/core/api_service/api_service.dart';

abstract class RemoteMovieDetails {
  Future<Response> getMovieDetails(String endPoint, String movieId);
  Future<Response> getMovieSuggestions(String endPoint, String movieId);
}

class RemoteMovieDetailsImpl implements RemoteMovieDetails {
  final ApiService apiService;

  RemoteMovieDetailsImpl({required this.apiService});
  @override
  Future<Response> getMovieDetails(String endPoint, String movieId) async {
    Response res = await apiService.getMovies(endPoint + movieId);
    return res;
  }

  @override
  Future<Response> getMovieSuggestions(String endPoint, String movieId) async {
    Response res = await apiService.getMovies(endPoint + movieId);
    return res;
  }
}
