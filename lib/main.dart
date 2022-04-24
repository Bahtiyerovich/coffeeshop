import 'package:coffii/core/components/theme_comp.dart';
import 'package:coffii/provider/coffee_upload_provider.dart';
import 'package:coffii/provider/login_provider.dart';
import 'package:coffii/provider/route_provider.dart';
import 'package:coffii/routes/myroute.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//1:16 minutga keldim videoni
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => RouteProvider()),
    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => CoffeeUploadProvider()),

  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final MyRoute _routes = MyRoute();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Shop',
      theme: ThemeComp.myTheme,
      onGenerateRoute: _routes.onGenerateRoute,
      initialRoute: context.watch<RouteProvider>().route,

      //  initialRoute: FireService.auth.currentUser != null ? '/home' : '/login',
    );
  }
}
