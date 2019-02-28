import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../shared/utils.dart';

class HomePage extends StatefulWidget {

   final String title;

   HomePage(this.title);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: Container(
        padding: EdgeInsets.only(top: 100.0, left: 50.0, right: 50.0),
        color: Colors.black,
        child: Column(
          
          children: <Widget>[
            Text('hello World', style:  TextStyle(color: Colors.white)),
            Text('hello World', style:  TextStyle(color: Colors.white)),
            Text('hello World', style:  TextStyle(color: Colors.white)),
            Text('hello World', style:  TextStyle(color: Colors.white)),
            Text('hello World', style:  TextStyle(color: Colors.white)),
          ]
        )
      ),
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          title: Image.asset('assets/t4h_full_logo.png', width:150),
          backgroundColor: Utilities.themeBlue,
          elevation: 0.0,
        ),
        body:  Container(
          color: Utilities.themeBlue,
          child: ListView(
            shrinkWrap: true,
            children: Utilities.menuWidgets(context, Utilities.getMenuItems()),
          ),
        )
      );
  }
}