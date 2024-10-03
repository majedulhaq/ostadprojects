import 'package:flutter/material.dart';
import 'package:ostadprojects/UI/Screens/splash_screen.dart';
// import 'package:ostadprojects/UI/Screens/splash_screen.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.greenAccent)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.greenAccent)),
            activeIndicatorBorder: BorderSide(color: Colors.red)),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
