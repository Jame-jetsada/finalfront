import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideBar extends StatefulWidget {
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  String? firstname;
  String? lastname;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      firstname = prefs.getString("firstname");
      lastname = prefs.getString("lastname");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(height: 20),
          ListTile(
            title: Text(
                'ชื่อ-นามสกุล: ${firstname ?? 'N/A'} ${lastname ?? 'N/A'}'),
          ),
        ],
      ),
    );
  }
}
