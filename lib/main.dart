import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:notepadpartone/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Notepad Fronend",
      home: Homepage(),
    );
  }
}
