import 'package:cine_stream_movie/models/genre_movies_model.dart';
import 'package:cine_stream_movie/repository/movies_rep.dart';
import 'package:cine_stream_movie/services/init_getit.dart';

class GenreMoviesUtils {
  static List<GenreMoviesModel> movieGenreNames(List<int> genreIds) {
    final movieRepository = getIt<MoviesRepository>();
    final cachedGenres = movieRepository.cachedGenres;
    List<GenreMoviesModel> genreNames = [];
    for (var genreId in genreIds) {
      var genre = cachedGenres.firstWhere(
        (element) => element.id == genreId,
        orElse: () => GenreMoviesModel(id: 5448484, name: 'Unknown'),
      );
      genreNames.add(genre);
    }
    return genreNames;
  }
}
