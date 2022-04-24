import 'package:coffii/service/firebase/fire_service.dart';
import 'package:flutter/material.dart';

class RouteProvider extends ChangeNotifier {
  RouteProvider() {
    checkLoginPage();
  }
  String route = '/login';

  void checkLoginPage() {
    if (FireService.auth.currentUser != null) {
      if (FireService.auth.currentUser!.email == 'admin@gmail.com') {
        FireService.auth.currentUser != null
            ? route = '/admin'
            : route = '/login';
      } else {
        FireService.auth.currentUser != null
            ? route = '/home'
            : route = '/login';
      }
    }
    notifyListeners();
  }
}
