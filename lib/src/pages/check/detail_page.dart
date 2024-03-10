import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myproject/src/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late String itmDesc1;
  late List<String> imageUrls;

  //final itmqtyController = TextEditingController();
  late TextEditingController itmqtyController;

  @override
  void initState() {
    super.initState();
    itmDesc1 = '';
    imageUrls = [];
    itmqtyController = TextEditingController();
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

  void saveProductData(String itmDesc1, String itmqty) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("itmDesc1", itmDesc1);
    prefs.setString("itm_qty", itmqty);
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
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
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
                  saveProductData(itmDesc1, itmqtyController.text);
                  Navigator.pushNamed(context, AppRoute.navigationpage);
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
