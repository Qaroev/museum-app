import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:museum_resource_center/views/home/page/home-page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Museum-Cnter',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: const HomePage()
    );
  }
}



