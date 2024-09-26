import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_scrapper/controller/search_provider.dart';
import 'package:sky_scrapper/controller/theme_provider.dart';
import 'package:sky_scrapper/view/splash_page.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ThemeProvider()..getTheme()),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
      ],
      builder: (context, child) {
        return Consumer<ThemeProvider>(builder: (context, tp, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode: tp.thememode);
        });
      },
    );
  }
}
