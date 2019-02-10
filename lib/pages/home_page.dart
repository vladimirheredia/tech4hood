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

  List<MenuItemModel> menuItems = <MenuItemModel>[
     MenuItemModel(
      'Events',
      'calendar_white.png',
      Color.fromARGB(255, 31, 40, 90),
      'events'
    ),
    MenuItemModel(
      'Members',
      'user_gray.png',
      Color.fromARGB(255, 31, 40, 80),
      'members'
    ),
     MenuItemModel(
      'Social Media',
      'share_white.png',
      Color.fromARGB(255, 54, 84, 144),
      'social'
    ),
     MenuItemModel(
      'Our Apps',
      'phone_white.png',
      Color.fromARGB(255, 82, 122, 170),
      'apps'
    ),
     MenuItemModel(
      'Media',
      'next_white.png',
      Color.fromARGB(255, 127, 177, 210),
      'media'
    ),
     MenuItemModel(
      'Miscellaneous',
      'next_white.png',
      Color.fromARGB(255, 154, 215, 255),
      'misc'
    )
  ];

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
          title: Center(child: Image.asset('assets/t4h_full_logo.png', width:120),),
          backgroundColor: Color.fromARGB(255, 18, 20, 61),
          
        ),
        body:  ListView(
          shrinkWrap: true,
          children: Utilities.menuWidgets(context, menuItems),
        )
      );
  }
}