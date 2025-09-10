import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/api_service/api_constant.dart';

class ApiService {
  Future<http.Response> auth({
    required String endPoint,
    required Map<String, dynamic> body,
  }) async {
    Uri url = Uri.https(ApiConstant.baseUrl, endPoint);

    http.Response response = await http.post(
      url,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    return response;
  }

  Future<http.Response> getMovies() async {
    http.Response response = await http.get(
      Uri.parse(ApiConstant.baseMovieUrl),

      headers: {'Content-Type': 'application/json'},
    );
    return response;
  }
}
