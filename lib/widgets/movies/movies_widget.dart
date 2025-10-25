// import 'package:cine_stream_movie/constants/my_app_constants.dart';
import 'package:cine_stream_movie/constants/my_app_icons.dart';
import 'package:cine_stream_movie/models/movies_model.dart';
import 'package:cine_stream_movie/screens/movie_details.dart';
import 'package:cine_stream_movie/services/init_getit.dart';
import 'package:cine_stream_movie/services/navigation_service.dart';
import 'package:cine_stream_movie/widgets/movies/cached_image.dart';
import 'package:cine_stream_movie/widgets/movies/favorite_btn.dart';
import 'package:cine_stream_movie/widgets/movies/genres_list_widget.dart';
import 'package:flutter/material.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({super.key, required this.movieModel});

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
         child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
               getIt<NavigationService>().navigate(MovieDetailsScreen(movieModel: movieModel,));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicWidth(
             child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedImageWidget(
                      imgUrl: "https://images.tmdb.org/t/p/w500/${movieModel.backdropPath}",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movieModel.originalTitle,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                         Row(
                          children: [
                            Icon(
                              MyAppIcons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            SizedBox(width: 5),
                            Text("${movieModel.voteAverage}/10"),
                          ],
                        ),
                        const SizedBox(height: 10),
                       const GenresListWidget(),

                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              MyAppIcons.watchLaterOutlined,
                              size:20,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 5),
                            Text(movieModel.releaseDate,
                              style: TextStyle(
                             color:
                                Colors.grey
                              ),
                            ),
                            const Spacer(),
                            const FavoriteBtnWidget(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}





