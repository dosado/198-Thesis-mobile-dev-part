import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thesis_app/recorder.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.blueAccent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        title: 'I- Kuon : Speech to Text');
    // theme: ThemeData(primarySwatch: Colors.blue);
  }
}
