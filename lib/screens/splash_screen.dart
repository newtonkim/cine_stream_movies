import 'package:cine_stream_movie/repository/movies_rep.dart';
import 'package:cine_stream_movie/screens/movies_screen.dart';
import 'package:cine_stream_movie/services/init_getit.dart';
import 'package:cine_stream_movie/services/navigation_service.dart';
import 'package:cine_stream_movie/widgets/my_error_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

Widget build(BuildContext context) {
    return Scaffold(
      body: true
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center, 
                children: [
                  Text('Loading...'),
                  SizedBox(height: 20),
                  CircularProgressIndicator.adaptive(),
                ],
              ),
            )
          : MyErrorWidget(
              errorText: '_errorMessage',
              retryFunction: (){},
            ),
    );
  }
  
}
