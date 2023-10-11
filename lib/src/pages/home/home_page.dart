import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 50),
                  ElevatedButton(onPressed: _OnClick, child: Text('1')),
                  SizedBox(height: 10),
                  ElevatedButton(onPressed: _OnClick, child: Text('2')),
                ]),
          )),
    );
  }

  void _OnClick() {}
}
