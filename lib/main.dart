import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Routes/app_pages.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LOGIN,
      getPages: appPages,
    );
  }
}
