import 'package:coffii/view/pages/cart_page.dart';
import 'package:coffii/view/pages/home_page.dart';
import 'package:coffii/view/pages/login_page.dart';
import 'package:coffii/view/pages/admin/admin_page.dart';
import 'package:flutter/material.dart';

class MyRoute {
  Route? onGenerateRoute(RouteSettings set) {
    var args = set.arguments;
    switch (set.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/cart':
        return MaterialPageRoute(builder: (_) => const CartPage());
      case '/admin':
        return MaterialPageRoute(builder: (_) => AdminPage());
    }
  }
}
