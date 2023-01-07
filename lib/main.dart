import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:museum_resource_center/utils/dimensions.dart';
import 'package:museum_resource_center/utils/get_di.dart';
import 'package:museum_resource_center/views/home/page/home-page.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
var selectedPageIndex = 1;
StreamController<dynamic> addToBasket = StreamController<dynamic>.broadcast();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static List<GetPage> routes = [
    GetPage(
      name: '/',
      transitionDuration: 350.milliseconds,
      page: () => const HomePage(),
      binding: InitialBinding(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Dimensions();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
      ),
      home: const HomePage(),
      defaultTransition: Transition.topLevel,
    );
  }
}



