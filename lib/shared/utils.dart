import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../pages/events_page.dart';
import '../pages/social_media_page.dart';
import '../pages/our_apps_page.dart';
import '../pages/media_page.dart';

class Utilities {
  static List<Widget> menuWidgets(BuildContext context,List<MenuItemModel> menuItems) {
    return List<Widget>.generate(
      menuItems.length,
      (int index) => GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Utilities.getPageFromId(menuItems[index].id)),
            );
        },
        child: Container(
              color: menuItems[index].bgColor,
              padding: EdgeInsets.all(40.0),
              child: Column(
                children: <Widget>[
                    Image.asset('assets/' + menuItems[index].image, width: 40.0, height: 40.0, fit: BoxFit.contain),
                    Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(menuItems[index].label, style: TextStyle(color: Colors.white)),
                  )
                ]
              ),
            )
      ),
    );
  }

  //events color
  static const Color blueOne = Color.fromARGB(255, 31, 40, 90);
  //social media color
  static const Color blueTwo = Color.fromARGB(255, 54, 84, 144);
  //our apps color
  static const Color blueThree = Color.fromARGB(255, 82, 122, 170);
  //media color
  static const Color blueFour = Color.fromARGB(255, 127, 177, 210);
  //miscellaneous color
  static const Color blueFive = Color.fromARGB(255, 154, 215, 255);


  static StatefulWidget getPageFromId(String id) {

    StatefulWidget pageWidget;
    switch(id) {
      case 'events':
      pageWidget = EventsPage('Events');
      break;
      case 'social':
      pageWidget = SocialMediaPage('Social Media');
      break;
      case 'apps':
      pageWidget = OurAppsPage('Our Apps');
      break;
      case 'media':
      pageWidget = MediaPage( 'Media');
      break;
      case 'misc':
      pageWidget = EventsPage('Events');
      break;
    }

    return pageWidget;
  }
}
