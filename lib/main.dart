import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_kart_pro/app/components/theme/dark_theme.dart';

import 'package:speed_kart_pro/app/modules/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: darkTheme,
      title: 'Speed Kart Fight',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.homeRoute,
      color: Colors.black,
      getPages: AppPages.routes,
    );
  }
}
