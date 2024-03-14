import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:myproject/src/pages/controller/productinfo.dart';
import 'package:myproject/src/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({Key? key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  TextEditingController _controller = TextEditingController();
  String? site_id;

  Future<void> startScanBarcode() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'ยกเลิก',
        true,
        ScanMode.BARCODE,
      );
      debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Fail';
    }
    if (!mounted) return;
    setState(() {
      _controller.text = barcodeScanRes;
    });
  }

  void getID(String id, String site_id) async {
    final prefs = await SharedPreferences.getInstance();
    String? site_id = prefs.getString("site_id");
    if (_controller.text.isNotEmpty) {
      try {
        final response = await http.get(
          Uri.parse(
              'http://10.0.2.2:8000/project-v0/product/getProductById/$id/$site_id'),
        );

        if (response.statusCode == 200) {
          Map<String, dynamic> data = json.decode(response.body);
          String resCode = data['res_code'];
          String resMsg = data['res_msg'];

          if (resCode == "000") {
            print("มีสินค้าอยู่ในระบบ");
            print(response.body);
            final prefs = await SharedPreferences.getInstance();
            prefs.setString("Itm_id", data["datas"][0]["Itm_id"]);
            prefs.setString("Itm_Desc1", data["datas"][0]["Itm_Desc1"]);
            prefs.setStringList("Product_image",
                List<String>.from(data["datas"][0]["Product_image"]));
            Navigator.pushNamed(context, AppRoute.detailpage);
          } else if (resCode == "E102") {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("สินค้าชิ้นนี้ถูกนับไปแล้ว"),
                  content: Text("กรุณานับสินค้าชนิดอื่น"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("ตกลง"),
                    ),
                  ],
                );
              },
            );
          } else {
            print("no data");
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("ไม่พบสินค้า"),
                  content: Text("ไม่พบข้อมูลสำหรับรหัสสินค้านี้"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("ตกลง"),
                    ),
                  ],
                );
              },
            );
            _controller.clear();
          }
        } else {
          print("HTTP Request failed with status: ${response.statusCode}");
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              maxLength: 13,
              onChanged: (value) {
                if (value.length == 13) {
                  getID(value, site_id.toString());
                }
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                hintText: 'ใส่รหัสสินค้า',
                hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: IconButton(
                  icon: Icon(Icons.qr_code_scanner),
                  onPressed: startScanBarcode,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  getID(_controller.text, site_id.toString());
                },
                child: Text('submit'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
