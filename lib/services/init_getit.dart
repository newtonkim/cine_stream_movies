import 'package:cine_stream_movie/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setUpLocator() {
  // Register NavigationService as a singleton
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
}
