import 'package:cine_stream_movie/models/genre_movies_model.dart';
import 'package:cine_stream_movie/models/movies_model.dart';
import 'package:cine_stream_movie/services/api_movie_service.dart';

class MoviesRepository {
// Pass the Movie Api service like this
  final ApiMovieService _apiMovieService;
    MoviesRepository(this._apiMovieService);

  /// Fetches a list of popular movies from the API.
  /// 
  /// Parameters:
  /// [page] - The page number to fetch. Defaults to 1.
  /// 
  /// Returns:
  /// A list of MovieModel objects.
  Future<List<MovieModel>> fetchMovies({int page = 1}) async {
   return  await _apiMovieService.fetchMovies(page: page);
  }

  /// Fetch all the genres from the API. This returns a list of
  /// GenreMoviesModel objects.
   Future<List<GenreMoviesModel>> fetchGenresMovies() async {
    return await _apiMovieService.fetchGenresMovies(); 
  }
}