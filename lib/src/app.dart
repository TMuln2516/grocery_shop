import 'package:flutter/material.dart';
import 'package:grocery_shop_app/src/resources/home_screen.dart';
import 'package:grocery_shop_app/src/resources/started_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StartedScreen(),
      routes: {
        '/introscreen': (context) => const StartedScreen(),
        '/homescreen': (context) => const HomeScreen()
      },
    );
  }
}
