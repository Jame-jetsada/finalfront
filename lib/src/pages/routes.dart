import 'package:flutter/material.dart';
import 'package:myproject/src/pages/home/home_page.dart';
import 'package:myproject/src/pages/login/login_page.dart';

class AppRoute {
  static const login = 'login';
  static const home = 'home';

  static get all => <String, WidgetBuilder>{
        login: (context) => LoginPage(),
        home: (context) => HomePage(),
      };
}
