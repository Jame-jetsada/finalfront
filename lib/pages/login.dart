import 'package:flutter/material.dart';
import 'package:myproject/components/signbt.dart';
import 'package:myproject/components/textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key,});

  // text controller
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  // sign uesr in method
  void signUserIn() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),

              //username textfiled
              MyTextField(
                controller: usernamecontroller,
                hintText: 'ชื่อผู้ใช้งาน',
                obcureText: false,
              ),
            
              const SizedBox(height: 10),

              //password
              MyTextField(
                controller: passwordcontroller,
                hintText: 'รหัสผ่าน',
                obcureText: true,
              ),

              const SizedBox(height: 10),

              SignBt(
                onTap: signUserIn,
              ),

            ],
          ),
        ),
      ),
    );
  }
}