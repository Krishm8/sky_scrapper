import 'package:flutter/material.dart';
import 'package:sky_scrapper/view/home.dart';
import 'package:sky_scrapper/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      routes: {
        "/": (context) => SplashScreen(),
      },
    );
  }
}