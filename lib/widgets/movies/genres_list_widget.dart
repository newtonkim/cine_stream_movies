// import 'package:cine_stream_movie/constants/my_app_constants.dart';
import 'package:cine_stream_movie/models/genre_movies_model.dart';
import 'package:cine_stream_movie/models/movies_model.dart';
import 'package:cine_stream_movie/utils/genre_movies_utils.dart';
import 'package:flutter/material.dart';

class GenresListWidget extends StatelessWidget {
  const GenresListWidget({
    super.key, 
    required this.movieModel
  });

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    List<GenreMoviesModel> moviesGenre = GenreMoviesUtils.movieGenreNames(
      movieModel.genreIds,
    );
    return Wrap(
      children: List.generate(
        moviesGenre.length,
        (index) => chipWidget(
          genreName: moviesGenre[index].name,
          context: context,
        ),
      ),
    );
  }

  Widget chipWidget({
    required String genreName,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: Chip(
        label: Text(genreName),
        backgroundColor: Colors.blue.withOpacity(0.1),
        side: BorderSide(color: Colors.blue.withOpacity(0.5)),
      ),
    );
  }
}
