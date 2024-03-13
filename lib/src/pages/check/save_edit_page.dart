import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveEditPage extends StatefulWidget {
  const SaveEditPage({Key? key});

  @override
  State<SaveEditPage> createState() => _SaveEditPageState();
}

class _SaveEditPageState extends State<SaveEditPage> {
  String? firstname;
  String? lastname;
  String? itmId;
  String? siteId;
  String? Itm_Desc1;
  int? itmqty;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      firstname = prefs.getString("firstname");
      lastname = prefs.getString("lastname");
      itmId = prefs.getString("Itm_id");
      siteId = prefs.getString("site_id");
      Itm_Desc1 = prefs.getString("Itm_Desc1");
      itmqty = prefs.getInt("itmqty");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('ProductName: ${Itm_Desc1 ?? 'N/A'}'),
          ),
          ListTile(
            title:
                Text('Firstname: ${firstname ?? 'N/A'} ${lastname ?? 'N/A'}'),
          ),
          ListTile(
            title: Text('Item ID: ${itmId ?? 'N/A'}'),
          ),
          ListTile(
            title: Text('Site ID: ${siteId ?? 'N/A'}'),
          ),
          ListTile(
            title: Text('Item Quantity: ${itmqty ?? 'N/A'}'),
          ),
        ],
      ),
    );
  }
}
