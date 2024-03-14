import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myproject/src/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late String itmDesc1;
  late String Itm_id;
  late List<String> imageUrls;
  late String firstname;
  late String lastname;
  late String site_id;

  //final itmqtyController = TextEditingController();
  late TextEditingController itmqtyController;

  @override
  void initState() {
    super.initState();
    itmDesc1 = '';
    imageUrls = [];
    itmqtyController = TextEditingController();
    firstname = '';
    lastname = '';
    site_id = '';
    Itm_id = '';
    getData();
  }

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      itmDesc1 = prefs.getString("Itm_Desc1") ?? '';
      List<String>? urls = prefs.getStringList("Product_image");
      imageUrls = urls ?? [];
    });
  }

  void saveProductData(int itmqty) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt("itmqty", itmqty);
      String? firstname = prefs.getString("firstname");
      String? lastname = prefs.getString("lastname");
      String? Itm_id = prefs.getString("Itm_id");
      String? site_id = prefs.getString("site_id");

      final response = await http.post(
          Uri.parse('http://10.0.2.2:8000/project-v0/product/countProduct'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            "firstname": firstname,
            "lastname": lastname,
            "site_id": site_id,
            "item_id": Itm_id,
            "item_qty": itmqty
          }));

      print(response.body);
      Map<String, dynamic> data = json.decode(response.body);
      // เข้าถึงค่า res_code และ res_msg
      String resCode = data['res_code'];
      String resMsg = data['res_msg'];

      print(firstname);
      print(lastname);
      print(Itm_id);
      print(site_id);
      print("count : $itmqty");
      if (resCode == "000") {
        print("save data success");
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('บันทึกสำเร็จ'),
              content: Text('ทำการบันทึกข้อมูลการนับสินค้าชนิดนี้สำเร็จแล้ว'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.navigationpage);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        print("save data failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 80, 177, 233),
        title: Text('นับสินค้า'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
            iconSize: 30,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (imageUrls.isNotEmpty)
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 280, // กำหนดความสูงของ ListView
                    child: ListView.builder(
                      shrinkWrap:
                          true, // ใช้ shrinkWrap เพื่อปรับขนาดของ ListView ให้พอดีกับข้อมูล
                      scrollDirection: Axis.horizontal,
                      itemCount: imageUrls.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.network(
                            imageUrls[index],
                            width: 250,
                            height: 100,
                            fit: BoxFit.fitWidth,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('$itmDesc1',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 20),
              TextField(
                controller: itmqtyController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  hintText: 'ใส่จำนวนสินค้า',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  int itmqty = int.parse(itmqtyController.text);
                  saveProductData(itmqty);
                },
                child: Text('บันทึก'),
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
