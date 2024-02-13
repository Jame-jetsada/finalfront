import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 're_check_page.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add),
          SizedBox(width: 8),
          Text('Add Item'),
        ],
      ),
    );
  }
}

class _CheckPageState extends State<CheckPage> {
  int index = 0;
  final screen = [
    // Center(child: Text('นับสินค้า', style: TextStyle(fontSize: 72))),
    // Center(child: Text('ดูรายงานการนับ', style: TextStyle(fontSize: 72)))
    ReCheckPage(),
    ReCheckPage2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('นับสินค้า'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.person_pin),
          onPressed: () {},
          iconSize: 30,
        ),
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
          backgroundColor: Color.fromARGB(255, 53, 156, 247),
          height: 80,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationDestination(
              icon: FaIcon(FontAwesomeIcons.checkToSlot, size: 30),
              label: 'นับสินค้า',
            ),
            NavigationDestination(
                icon: FaIcon(FontAwesomeIcons.sheetPlastic),
                label: 'ดูรายงานการนับ'),
          ],
        ),
      ),
    );
  }
}
