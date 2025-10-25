import 'package:cine_stream_movie/repository/movies_rep.dart';
import 'package:cine_stream_movie/screens/movies_screen.dart';
import 'package:cine_stream_movie/services/init_getit.dart';
import 'package:cine_stream_movie/services/navigation_service.dart';
import 'package:cine_stream_movie/widgets/my_error_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = true;
  String _errorMessage = '';
  final _movieRepository = getIt<MoviesRepository>();

  @override
  void initState() {
    super.initState();
    _fetchGenreData();
  }

  Future<void> _fetchGenreData() async {
    setState(() {
      isLoading = true;
      _errorMessage = '';
    });
    try {
      await _movieRepository.fetchGenresMovies();
      await getIt<NavigationService>().navigateToReplacement(
        const MoviesScreen(),
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load genre data: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
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
              errorText: _errorMessage,
              retryFunction: _fetchGenreData,
            ),
    );
  }
}
