import 'package:flutter/material.dart';
import 'package:tech4hood/models/menu_item.dart';
import 'package:tech4hood/shared/utils.dart';

class SkillsPage extends StatefulWidget {

  String title;

  SkillsPage(String _title, MenuItemModel selectedSkillLevel) {
    this.title = _title;
    Utilities.selectedSkill = selectedSkillLevel;
  }

  @override
  _SkillsPageState createState() =>  _SkillsPageState();

}

class _SkillsPageState extends State<SkillsPage> {
  @override
  List<MenuItemModel> menuItems = <MenuItemModel>[
     MenuItemModel(
      'AR / VR',
      't4h_services_ar_vr.png',
      Color(0xffee5455),
      Colors.white,
      'track',
      'arvr_banner.jpg'
    ),
     MenuItemModel(
      'Web Dev',
      't4h_services_webdev.png',
      Color(0xff15b1ad),
      Colors.white,
      'track',
      'webdev_banner.jpg'
    ),
    MenuItemModel(
      'Mobile Dev',
      't4h_services_mobiledev.png',
      Color(0xffffa511),
      Colors.white,
      'track',
      'mobiledev_banner.jpg'
    ),
    MenuItemModel(
      'DevOps',
      't4h_dev_ops_icon.png',
      Color(0xff9d1de6),
      Colors.white,
      'track',
      'devops_banner.png'
    ),
    MenuItemModel(
      'Cloud',
      't4h_storage_icon.png',
      Color(0xff008c01),
      Colors.white,
      'track',
      'cloudstorage_banner.png'
    ),
    MenuItemModel(
      '3D Modeling',
      't4h_services_3dmodeling.png',
      Color(0xff5852ec),
      Colors.white,
      'track',
      '3dmodeling_banner.jpg'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Select a Technology Track:'),
          backgroundColor: Color.fromARGB(255, 18, 20, 61),
          
        ),
        body:  Container(
          color: Utilities.blueTwo,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: Utilities.getTechTrackMenuItemWidgets(context, menuItems),
                ),
              )
            ],
          ),
        )
      );
  }
}