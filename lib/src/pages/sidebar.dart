import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('name: '),
          ),
          ListTile(
            title: Text('branch: '),
          )
        ],
      ),
    );
  }
}
