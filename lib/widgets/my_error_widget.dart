import 'package:cine_stream_movie/constants/my_app_icons.dart';
import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({
    super.key,
    required this.errorText,
    required this.retryFunction,
    
    });

    final String errorText;
    final Function retryFunction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
            const Icon(
              MyAppIcons.errorIcon, 
                size: 50, 
                color: Colors.red,
            ),
            SizedBox(height: 20),
          Text(
            'Something went wrong!',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 18),
          ),
          SizedBox(height:10),
          ElevatedButton(
            onPressed: (){
            retryFunction();
          },
            child: const Text(
              'Retry', 
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  }
}