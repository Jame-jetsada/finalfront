import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SaveEditPage extends StatefulWidget {
  const SaveEditPage({Key? key});

  @override
  State<SaveEditPage> createState() => _SaveEditPageState();
}

class _SaveEditPageState extends State<SaveEditPage> {
  List<dynamic> data = [];
  int? CountAllSite;
  int? CountedProduct;

  @override
  void initState() {
    super.initState();
    getCountProductAll();
  }

  void getCountProductAll() async {
    final prefs = await SharedPreferences.getInstance();
    String? site_id = prefs.getString("site_id");
    try {
      final response = await http.get(Uri.parse(
          'http://10.0.2.2:8000/project-v0/product/getCountProductAll/$site_id'));

      if (response.statusCode == 200) {
        print(response.body);
        Map<String, dynamic> responseData = json.decode(response.body);
        setState(() {
          CountAllSite = responseData['CountAllSite'];
          CountedProduct = responseData['CountedProduct'];
          data = json.decode(response.body)['datas'];
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: ListView.builder(
      //     itemCount: data.length,
      //     itemBuilder: (context, index) {
      //       var item = data[index];
      //       return Card(
      //         child: ListTile(
      //           title: Text(
      //               'ชื่อสินค้า: ${item['item_desc1']} \nจำนวน: ${item['item_qty']} \nวันที่และเวลา: ${item['count_date']}'),
      //           subtitle: Text('ชื่อผู้นับ: ${item['name']}'),
      //         ),
      //       );
      //     },
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              'จำนวนสินค้าทั้งหมด: $CountAllSite',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'จำนวนสินค้าที่นับไปแล้ว: $CountedProduct',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var item = data[index];
                  return Card(
                    child: ListTile(
                      title: Text(
                          'ชื่อสินค้า: ${item['item_desc1']} \nจำนวน: ${item['item_qty']} \nวันที่และเวลา: ${item['count_date']}'),
                      subtitle: Text('ชื่อผู้นับ: ${item['name']}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
