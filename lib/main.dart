import 'package:flutter/material.dart';
import 'screens/get_started.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RSS Security Registration',

        theme: ThemeData(
          // fontFamily: 'Outfit', // Set custom font for the entire app
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

      home: const GetStartedScreen(),
    );
  }
}

