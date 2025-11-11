// import 'package:cine_stream_movie/constants/my_app_constants.dart';
import 'package:cine_stream_movie/models/movies_model.dart';
import 'package:cine_stream_movie/widgets/movies/cached_image.dart';
import 'package:cine_stream_movie/widgets/movies/favorite_btn.dart';
import 'package:cine_stream_movie/widgets/movies/genres_list_widget.dart';
import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movieModel});

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
   
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
          Hero(
            tag: movieModel.id,
              child: SizedBox(
                width: double.infinity,
                height: size.height * 0.45,
                child: CachedImageWidget(
                  imgUrl: "https://images.tmdb.org/t/p/w500/${movieModel.backdropPath}",
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 25),
                                 Text(
                                  movieModel.originalTitle,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),

                                const SizedBox(height: 5.0),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20.0,
                                    ),
                                    SizedBox(width: 5.0),
                                    Text("${movieModel.voteAverage.toStringAsFixed(1)}/10"),
                                    Spacer(),
                                    Text(
                                      movieModel.releaseDate,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                 GenresListWidget(movieModel: movieModel),
                                const SizedBox(height: 15),
                                Text(
                                  movieModel.overview, // Sample overview text
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(fontSize: 18.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: FavoriteBtnWidget(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
