import 'package:cine_stream_movie/constants/my_app_icons.dart';
import 'package:flutter/material.dart';

class FavoriteBtnWidget extends StatelessWidget {
  const FavoriteBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
       // TODO: Implement add to favourites.
      },
      icon: const Icon(
        MyAppIcons.favoriteRounded, 
        // color: Colors.red,
        size: 20,
      ),
    );
  }
}
