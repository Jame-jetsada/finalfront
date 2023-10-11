import 'package:flutter/material.dart';
import 'package:myproject/src/pages/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    usernamecontroller.text = "admin";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: usernamecontroller,
                decoration: InputDecoration(labelText: "Username"),
              ),
              TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(labelText: "Password"),
              ),
              ElevatedButton(onPressed: _OnClick, child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }

  void _OnClick() {
    // print("login success (${usernamecontroller.text})");
    Navigator.pushNamed(context, AppRoute.home);
  }
}
