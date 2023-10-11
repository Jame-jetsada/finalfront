import 'package:flutter/material.dart';
import 'package:myproject/src/pages/login/login_page.dart';
import 'package:myproject/src/pages/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FirstApp",
      debugShowCheckedModeBanner: false,
      routes: AppRoute.all,
      home: LoginPage(),
    );
  }
}
