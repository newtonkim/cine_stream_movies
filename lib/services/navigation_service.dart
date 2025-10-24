import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigatorKey;

  NavigationService() {
    navigatorKey = GlobalKey<NavigatorState>();
  }

  navigate(Widget widget) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  Future<void> showDialog(Widget widget) async {
    await showAdaptiveDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => widget,
    );
  }

  showSnackBar(String message) {
    final context = navigatorKey.currentContext!;
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    final snackbarwidget = SnackBar(
      content: Text(
        message,style:const TextStyle(
          color: Colors.white,)
        ),
      );
    ScaffoldMessenger.of(context).showSnackBar(snackbarwidget);
  }
}
