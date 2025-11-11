// import 'dart:developer';

import 'package:cine_stream_movie/constants/my_app_icons.dart';
import 'package:cine_stream_movie/constants/my_theme_data.dart';
// import 'package:cine_stream_movie/models/genre_movies_model.dart';
import 'package:cine_stream_movie/models/movies_model.dart';
// import 'package:cine_stream_movie/models/movies_model.dart';
import 'package:cine_stream_movie/repository/movies_rep.dart';
import 'package:cine_stream_movie/screens/favorite_screen.dart';
// import 'package:cine_stream_movie/services/api_movie_service.dart';
import 'package:cine_stream_movie/services/init_getit.dart';
import 'package:cine_stream_movie/services/navigation_service.dart';
import 'package:cine_stream_movie/view_models/theme_provider.dart';
import 'package:cine_stream_movie/widgets/movies/movies_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

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
          Consumer(
            builder: (context, ThemeProvider themeProvider, child) {
              return IconButton(
                onPressed: () async {
                  themeProvider.toggleTheme();
                },
                icon: Icon(
                  themeProvider.themeData == MyThemeData.darkTheme
                      ? MyAppIcons.darkMode
                      : MyAppIcons.lightMode,
                ),
              );
            },
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return MoviesWidget();
        },
      ),
    );
  }
}
