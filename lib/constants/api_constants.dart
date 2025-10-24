
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String get apiKey {
    try {
      return dotenv.get('MOVIES_API_KEY');
    } catch (e) {
     
      return '';
    }
  }
  static String get bearerToken {
    try {
      return dotenv.get('MOVIES_BEARERTOKEN');
    } catch (e) {
     
      return '';
    }
  }
      
  static String baseUrl = "https://api.themoviedb.org/3";
  static Map<String, String> get headers => {
        'Authorization': 
              'Bearer $bearerToken',
        'accept': 'application/json',
  };
}
