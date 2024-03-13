import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myproject/src/pages/check/save_edit_page.dart';

import '../pages/check/check_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int index = 0;
  final screen = [CheckPage(), SaveEditPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 80, 177, 233),
        //automaticallyImplyLeading: false,
        title: Text('เลือกเมนู'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
            iconSize: 30,
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: screen[index],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade100,
          labelTextStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
        child: NavigationBar(
          backgroundColor: Color.fromARGB(255, 80, 177, 233),
          height: 80,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationDestination(
              icon: FaIcon(FontAwesomeIcons.checkToSlot, size: 30),
              label: 'นับสินค้า',
            ),
            NavigationDestination(
                icon: Icon(Icons.save_as_rounded), label: 'แก้ไขและบันทึก')
          ],
        ),
      ),
    );
  }
}
