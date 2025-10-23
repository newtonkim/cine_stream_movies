import 'package:cine_stream_movie/constants/my_app_icons.dart';
import 'package:cine_stream_movie/widgets/movies/movies_widget.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Favorite Movies'
          ),
        actions:[
          IconButton(
            onPressed: () {
              // Implement search functionality
            },
            icon: const Icon(
              MyAppIcons.delete,
              color: Colors.red,
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
