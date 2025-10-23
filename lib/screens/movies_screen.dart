import 'package:cine_stream_movie/constants/my_app_icons.dart';
import 'package:cine_stream_movie/screens/favorite_screen.dart';
import 'package:cine_stream_movie/widgets/movies/movies_widget.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: const Text(
          'Popular Movies'
          ),
        actions:[
          IconButton(
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => const FavoriteScreen(),
                  ),
                );
            },
            icon: const Icon(
              MyAppIcons.favoriteRounded,
              color: Colors.red,
              ),
          ),
          IconButton(
            onPressed: () {
              // Implement search functionality
            },
            icon: const Icon(
              MyAppIcons.darkMode,
              ),
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
