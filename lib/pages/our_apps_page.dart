import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../shared/utils.dart';

class OurAppsPage extends StatefulWidget {

  final String title;
  
  OurAppsPage(this.title);

  @override
  _OurAppsPageState createState() =>  _OurAppsPageState();

}

class _OurAppsPageState extends State<OurAppsPage> {

  List<MenuItemModel> menuItems = <MenuItemModel>[
     MenuItemModel(
      'Android Apps',
      'apps_android.png',
      Color.fromARGB(255, 122, 192, 13),
      Colors.white,
      'android'
    ),
     MenuItemModel(
      'IOS Apps',
      'apps_ios.png',
      Color.fromARGB(255, 114, 77, 186),
      Colors.white,
      'ios'
    ),
     MenuItemModel(
      'Web Apps',
      'apps_web.png',
      Color.fromARGB(255, 47, 159, 221),
      Colors.white,
      'web'
    )];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color.fromARGB(255, 18, 20, 61),
          
        ),
        body:  ListView(
          shrinkWrap: true,
          children: Utilities.menuWidgets(context, menuItems)
        )
      );
  }
}