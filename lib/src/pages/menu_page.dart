import 'package:flutter/material.dart';
import 'package:myproject/src/pages/sidebar.dart';
import 'package:myproject/src/routes/routes.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 80, 177, 233),
        automaticallyImplyLeading: false,
        title: Text('เลือกเมนู'),
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(Icons.person_pin),
        //   onPressed: () {},
        //   iconSize: 30,
        // ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.menu),
        //     onPressed: () {},
        //     iconSize: 30,
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 30),
                  ElevatedButton(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'นับสินค้า',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoute.navigationpage);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 80, 177, 233),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'รายงานปัญหา',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoute.reportpage);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 80, 177, 233),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 600,
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                      onPressed: () {
                        _handleLogout(context);
                      },
                      icon: Icon(Icons.logout),
                      iconSize: 50,
                    ),
                  ),
                ])),
      ),
    );
  }

  void _handleLogout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoute.loginpage,
      (Route<dynamic> route) => false,
    );
  }
}
