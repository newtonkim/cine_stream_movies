import 'package:cine_stream_movie/constants/my_app_icons.dart';
import 'package:flutter/material.dart';

class FavoriteBtnWidget extends StatelessWidget {
  const FavoriteBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
       // TODO: Implement favorite logic
      },
      icon: const Icon(
        MyAppIcons.favoriteRounded, 
        color: null,
        size: 20,
      ),
    );
  }
}
