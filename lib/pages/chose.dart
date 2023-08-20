import 'package:flutter/material.dart';

class ChoosePage extends StatelessWidget {
  const ChoosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('choose'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),   
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
                         
            ],
          ),
        ),
      ),
    );
  }
}