import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../shared/utils.dart';

class SocialMediaPage extends StatefulWidget {

  final String title;

  SocialMediaPage(this.title);

  @override
  _SocialMediaPageState createState() =>  _SocialMediaPageState();

}

class _SocialMediaPageState extends State<SocialMediaPage> {

  List<MenuItemModel> menuItems = <MenuItemModel>[
    //  MenuItemModel(
    //   'Facebook',
    //   'social_facebook.png',
    //   Color.fromARGB(255, 51, 79, 141),
    //   'fb'
    // ),
     MenuItemModel(
      'Twitter',
      'social_twitter.png',
      Color.fromARGB(255, 75, 162, 235),
      'tw'
    ),
     MenuItemModel(
      'Instagram',
      'social_instagram.png',
      Color.fromARGB(255, 158, 75, 150),
      'inst'
    ),
     MenuItemModel(
      'YouTube',
      'social_youtube.png',
      Color.fromARGB(255, 233, 25, 33),
      'yt'
    )
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color.fromARGB(255, 18, 20, 61),
          
        ),
        body:  ListView(
          shrinkWrap: true,
          children: Utilities.menuWidgets(context, menuItems),
        )
      );
  }
}