import 'package:flutter/material.dart';
import 'package:myproject/src/pages/check/check_page.dart';
import 'package:myproject/src/pages/check/detail_page.dart';
import 'package:myproject/src/pages/check/save_edit_page.dart';
import 'package:myproject/src/routes/navigation_page.dart';
import 'package:myproject/src/pages/menu_page.dart';
import 'package:myproject/src/pages/reportproblem/report_page.dart';
import 'package:myproject/src/pages/login_page.dart';

class AppRoute {
  static const String loginpage = 'login';
  static const String menupage = 'menu';
  static const String navigationpage = 'navigation';
  static const String checkpage = 'check';
  static const String reportpage = 'report';
  static const String detailpage = 'detail';
  static const String saveEditpage = 'saveEdit';

  // static Route<dynamic> generateRoute(RouteSettings settings){
  //   switch (settings.name){
  //     case loginpage:
  //       return MaterialPageRoute(
  //         builder: (context) => LoginPage()
  //       );

  //     case menupage:
  //       return MaterialPageRoute(
  //         builder: (context) => MenuPage()
  //       );

  //     case checkpage:
  //       return MaterialPageRoute(
  //         builder: (context) => CheckPage()
  //       );

  //     case reportpage:
  //       return MaterialPageRoute(
  //         builder: (context) => ReportPage()
  //       );

  //     default:
  //       throw FormatException('Route not found');
  //   }
  // }

  static get all => <String, WidgetBuilder>{
        loginpage: (context) => const LoginPage(),
        menupage: (context) => const MenuPage(),
        navigationpage: (context) => const NavigationPage(),
        checkpage: (context) => const CheckPage(),
        reportpage: (context) => const ReportPage(),
        detailpage: (context) => const DetailPage(),
        saveEditpage: (context) => const SaveEditPage(),
      };
}
