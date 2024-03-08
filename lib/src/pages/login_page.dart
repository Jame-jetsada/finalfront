import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myproject/src/routes/routes.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  bool Pass_visible = true;

  @override
  void initState() {
    super.initState();
    // usernamecontroller.text = "admin";
  }

  void _OnClick() {
    // print("login success (${usernamecontroller.text})");
    Login(
      usernamecontroller.text.toString(),
      passwordcontroller.text.toString(),
      context,
    );

    // ใส่ในตอนที่ไม่ได้รันแบคเอน
    // Navigator.popAndPushNamed(context, AppRoute.menupage);
  }

  void Login(String username, String password, BuildContext context) async {
    // ตรวจสอบว่า username และ password ไม่ใช่ค่าว่าง
    if (username.isNotEmpty && password.isNotEmpty) {
      try {
        final response = await http.get(Uri.parse(
            'http://10.0.2.2:8000/project-v0/profile/login/$username/$password'));

        // if (response.statusCode == 200) {
        //   // การแปลงข้อมูล JSON
        //   Map<String, dynamic> data = json.decode(response.body);
        //   print("Response Data: $data");
        // } else {
        //   print("HTTP Request failed with status: ${response.statusCode}");
        // }

        if (response.statusCode == 200) {
          // การแปลงข้อมูล JSON

          Map<String, dynamic> data = json.decode(response.body);
          // print("Response Data: $data");

          // เข้าถึงค่า res_code และ res_msg
          String resCode = data['res_code'];
          String resMsg = data['res_msg'];

          // ตรวจสอบค่า res_code
          if (resCode == "000") {
            print("Login success");
            Navigator.pushNamed(context, AppRoute.menupage);
          } else {
            print("Login failed");
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('ล็อคอินไม่ผ่าน'),
                  content: Text('กรุณาตรวจสอบชื่อผู้ใช้งานและรหัสผ่านของคุณ'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // ปิด pop-up
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
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
      backgroundColor: Color.fromARGB(255, 80, 177, 233),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
              ),
              Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 400,
                  height: 200),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'กรุณาเข้าสู่ระบบ',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: usernamecontroller,
                        decoration: InputDecoration(
                          labelText: "ชื่อผู้ใช้งาน",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: passwordcontroller,
                        obscureText: Pass_visible,
                        decoration: InputDecoration(
                          labelText: "รหัสผ่าน",
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(Pass_visible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                Pass_visible = !Pass_visible;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _OnClick,
                      child: Text('เข้าสู่ระบบ'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
