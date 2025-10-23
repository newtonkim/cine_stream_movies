import 'package:cine_stream_movie/constants/my_app_constants.dart';
import 'package:flutter/material.dart';

class GenresListWidget extends StatelessWidget {
  const GenresListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(MyAppConstants.genres.length, (index)=>chipWidget(genreName:MyAppConstants.genres[index], context: context )),
    );
  }

  Widget chipWidget({required String genreName, required BuildContext context}) {
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