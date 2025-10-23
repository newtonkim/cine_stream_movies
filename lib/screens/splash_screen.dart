import 'package:cine_stream_movie/widgets/my_error_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyErrorWidget(errorText: 'errorText', retryFunction: () {}),
    );
  }
}