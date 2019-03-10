import 'package:flutter/material.dart';
import 'package:tech4hood/models/menu_item.dart';
import 'package:tech4hood/shared/utils.dart';

class LearningPage extends StatefulWidget {

  final String title;

  LearningPage(this.title);

  @override
  _LearningPageState createState() =>  _LearningPageState();

}

class _LearningPageState extends State<LearningPage> {
  @override
  List<MenuItemModel> menuItems = <MenuItemModel>[
     MenuItemModel(
      'Beginner',
      't4h_beginner_icon.png',
      Color(0xff2C1940),
      Colors.white,
      'skills',
      'beginner_banner.jpg'
    ),
     MenuItemModel(
      'Intermediate',
      't4h_intermediate_icon.png',
      Color(0xff59337F),
      Colors.white,
      'skills',
      'intermediate_banner.jpg'
    ),
     MenuItemModel(
      'Advanced',
      't4h_advanced_icon.png',
      Color(0xFF854CBF),
      Colors.white,
      'skills',
      'advanced_banner.jpg'
    )
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Select your skill Level'),
          backgroundColor: Color(0xff2C1940),
          
        ),
        body:  Container(
          color: Color(0xff2C1940),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: Utilities.getSkillLevelMenuItemWidgets(context, menuItems),
                ),
              )
            ],
          ),
        )
      );
  }
}