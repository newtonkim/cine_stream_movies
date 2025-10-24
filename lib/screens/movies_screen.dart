import 'dart:developer';

import 'package:cine_stream_movie/constants/my_app_icons.dart';
// import 'package:cine_stream_movie/models/genre_movies_model.dart';
import 'package:cine_stream_movie/models/movies_model.dart';
// import 'package:cine_stream_movie/models/movies_model.dart';
import 'package:cine_stream_movie/repository/movies_rep.dart';
import 'package:cine_stream_movie/screens/favorite_screen.dart';
// import 'package:cine_stream_movie/services/api_movie_service.dart';
import 'package:cine_stream_movie/services/init_getit.dart';
import 'package:cine_stream_movie/services/navigation_service.dart';
import 'package:cine_stream_movie/widgets/movies/movies_widget.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final List<MovieModel> movies = [];
  bool _isFetching = false;
  int _currentPage = 1;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _fetchMovies();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isFetching) {
      _fetchMovies();
    }
  }

  Future<void> _fetchMovies() async {
    if (_isFetching) return;

    setState(() {
      _isFetching = true;
    });

    try {
      final List<MovieModel> newMovies =
        await getIt<MoviesRepository>().fetchMovies(page: _currentPage);
      setState(() {
        movies.addAll(newMovies);
        _currentPage++;
      });
    } catch (e) {
      getIt<NavigationService>().showSnackBar('Error fetching movies occured. $e');
      // log('Error fetching movies: $e');
    } finally {
      setState(() {
        _isFetching = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: const Text('Popular Movies'),
        actions: [
          IconButton(
            onPressed: () {
              getIt<NavigationService>().navigate(FavoriteScreen());
            },
            icon: const Icon(MyAppIcons.favoriteRounded, color: Colors.red),
          ),
          IconButton(
            onPressed: () async {
              //  final List<MovieModel> movies = await getIt<ApiMovieService>().fetchMovies();
              //  log("movies $movies");
              //  final List<GenreMoviesModel> genres = await getIt<ApiMovieService>().fetchGenresMovies();
              //  log("genres $genres");
              // final List<GenreMoviesModel> genres =
              //   await getIt<MoviesRepository>().fetchGenresMovies();
              //   log("genres $genres");
            },
            icon: const Icon(MyAppIcons.darkMode),
          ),
        ],
      ),

      body: ListView.builder(
        controller: _scrollController,
        itemCount: movies.length + (_isFetching ? 1 : 0),
        itemBuilder: (context, index) {
         if(index < movies.length){
           return MoviesWidget();
         } else{
          return SizedBox(height: 10, width: 10, child: const CircularProgressIndicator());
         }
        },
      ),
    );
  }
}
