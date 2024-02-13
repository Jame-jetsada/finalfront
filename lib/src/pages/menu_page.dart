import 'package:flutter/material.dart';
import 'package:myproject/src/routes/routes.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('เลือกเมนู'),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.person_pin),
          onPressed: () {},
          iconSize: 30,
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.menu),
          onPressed: () {},
          iconSize: 30, 
          ),          
        ],
      ),

      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 50
                    ),
      
                    ElevatedButton(
                      child: Text('นับสินค้า'),
                      onPressed: (){
                        Navigator.of(context).pushNamed(AppRoute.checkpage);
                      },
                    ),
      
                    SizedBox(
                      height: 10
                    ),
      
                    ElevatedButton(
                      child: Text('รายงานปัญหา'),
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoute.reportpage);
                      },
                    ),
      
                    Container(
                      height: 600,
                      alignment: Alignment.bottomLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        }, 
                        icon: Icon(Icons.logout),
                        iconSize: 50,
                      ),                      
                    )                  
                  ]),
            )),
      ),
    );
  }

  void _OnClick(){
    // Check(Navigator.pushNamed(context, AppRoute.check));
  }
}