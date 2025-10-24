import 'dart:convert';
import 'dart:developer';
import 'package:cine_stream_movie/constants/api_constants.dart';
import 'package:cine_stream_movie/models/genre_movies_model.dart';
import 'package:cine_stream_movie/models/movies_model.dart';
import 'package:http/http.dart' as http;

class ApiMovieService {
  Future<List<MovieModel>> fetchMovies({int page = 1}) async {
    final url = Uri.parse(
      "${ApiConstants.baseUrl}/movie/popular?language=en-US&page=1",
    );
    final response = await http.get(url, headers: ApiConstants.headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      log("data $data");
      return List.from(data['results'].map((element)=> MovieModel.fromJson(element)));
         
    } else {
      throw Exception('Failed to load movies:, ${response.statusCode}');
    }
  }

  Future<List<GenreMoviesModel>> fetchGenresMovies() async {
    final url = Uri.parse(
      "${ApiConstants.baseUrl}/genre/movie/list?language=en",
    );
    final response = await http.get(url, headers: ApiConstants.headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      log("data $data");
     return List.from(data['genres'].map((element)=> GenreMoviesModel.fromJson(element)));
         
    } else {
      throw Exception('Failed to load genre details:, ${response.statusCode}');
    }
  }
}
