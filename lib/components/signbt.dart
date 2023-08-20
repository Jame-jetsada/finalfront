import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignBt extends StatelessWidget {

  void Function()? onTap;

  SignBt({super.key, required this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25.0),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          ),
        child: const Center(
          child: Text(
            "เข้าสู่ระบบ",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}