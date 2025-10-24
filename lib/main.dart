// import 'package:cine_stream_movie/constants/api_constants.dart';
import 'package:cine_stream_movie/constants/my_theme_data.dart';
// import 'package:cine_stream_movie/screens/favorite_screen.dart';
// import 'package:cine_stream_movie/screens/movie_details.dart';
// import 'package:cine_stream_movie/screens/splash_screen.dart';
import 'package:cine_stream_movie/screens/movies_screen.dart';
import 'package:cine_stream_movie/services/init_getit.dart';
import 'package:cine_stream_movie/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: "assets/.env");

  setUpLocator();
  await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Cine Stream Movie',
      theme: MyThemeData.lightTheme,
      home: const MoviesScreen(),
      // home: const FavoriteScreen(),
      // home: const MovieDetailsScreen(),
      // home: const SplashScreen(),
    );
  }
}




