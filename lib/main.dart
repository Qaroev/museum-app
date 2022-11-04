import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:museum_resource_center/home/page/home-page.dart';
import 'package:museum_resource_center/poster/poster_events_output.dart';
import 'package:museum_resource_center/show/show_events_output.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Museum-Cnter',
      theme: ThemeData(
        fontFamily: 'Roboto',
        // primaryColor: Color(0xFFE5E5E5),
        // backgroundColor: Color(0xFFE5E5E5)
      ),
      home: HomePage()
    );
  }
}



