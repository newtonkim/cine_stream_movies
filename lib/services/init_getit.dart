import 'package:cine_stream_movie/repository/movies_rep.dart';
import 'package:cine_stream_movie/services/api_movie_service.dart';
import 'package:cine_stream_movie/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setUpLocator() {
  // Register NavigationService as a singleton
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<ApiMovieService>(() => ApiMovieService());
  getIt.registerLazySingleton<MoviesRepository>(() => MoviesRepository(getIt<ApiMovieService>()));
}