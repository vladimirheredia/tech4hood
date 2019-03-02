import 'package:flutter/material.dart';
import 'package:tech4hood/models/contact_model.dart';
import 'package:tech4hood/models/instagram_entry.dart';
import 'package:tech4hood/models/resources.dart';
import 'package:tech4hood/models/team_member.dart';
import 'package:tech4hood/pages/contact_page.dart';
import 'package:tech4hood/pages/instagram_page.dart';
import 'package:tech4hood/pages/learning_page.dart';
import 'package:tech4hood/pages/resources_page.dart';
import 'package:tech4hood/pages/team_page.dart';
import 'package:tech4hood/pages/youtube_page.dart';
import '../models/menu_item.dart';
import '../pages/events_page.dart';
import '../pages/social_media_page.dart';
import '../pages/our_apps_page.dart';
import '../pages/members_page.dart';
import '../pages/twitter_page.dart';

class Utilities {

  static Color themeBlue = Color.fromARGB(255, 18, 20, 61);
  static const Color googleGreen = Color.fromRGBO(22, 157, 85, 1.0);
  static Color twitterBlue = Color.fromARGB(255, 75, 162, 235);

  static List<MenuItemModel> getMenuItems() {
      return <MenuItemModel>[
      MenuItemModel(
        'Events',
        'calendar_white.png',
        Utilities.themeBlue,
        Colors.white,
        'events'
      ),
      MenuItemModel(
        'Members',
        'user_white.png',
        Color.fromARGB(255, 31, 40, 80),
        Colors.white,
        'members'
      ),
      MenuItemModel(
        'Social Media',
        'share_white.png',
        Color.fromARGB(255, 54, 84, 144),
        Colors.white,
        'social'
      ),
      MenuItemModel(
        'Our Team',
        't4h_team.png',
        Color.fromARGB(255, 82, 122, 170),
        Colors.white,
        'team'
      ),
      MenuItemModel(
        'Resources',
        'cog_white.png',
        Color.fromARGB(255, 127, 177, 210),
        Colors.white,
        'resources'
      ),
      MenuItemModel(
        'Learning',
        'learning_blue.png',
        Color.fromARGB(255, 154, 215, 255),
        Color.fromARGB(255, 31, 40, 80),
        'learning'
      )
    ];
  }

  static List<Widget> menuWidgets(
      BuildContext context, List<MenuItemModel> menuItems) {
    return List<Widget>.generate(
      menuItems.length,
      (int index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Utilities.getPageFromId(menuItems[index].id)),
            );
          },
          child: Container(
            color: menuItems[index].bgColor,
            padding: EdgeInsets.all(40.0),
            child: Column(children: <Widget>[
              Image.asset('assets/' + menuItems[index].image,
                  width: 40.0, height: 40.0, fit: BoxFit.contain),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text(menuItems[index].label,
                    style: TextStyle(color: menuItems[index].labelColor)),
              )
            ]),
          )),
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

  static const Color instagramColor = Color.fromARGB(255, 158, 75, 150);

  static StatefulWidget getPageFromId(String id) {
    StatefulWidget pageWidget;
    switch (id) {
      case 'events':
        pageWidget = EventsPage('Events');
        break;
      case 'members':
        pageWidget = MembersPage('Members');
        break;
      case 'social':
        pageWidget = SocialMediaPage('Social Media');
        break;
      case 'apps':
        pageWidget = OurAppsPage('Our Apps');
        break;
      case 'resources':
        pageWidget = ResourcesPage('Resources');
        break;
      case 'learning':
        pageWidget = LearningPage('Learning');
        break;
      case 'tw':
        pageWidget = TwitterPage('Twitter');
        break;
      case 'instagram':
        pageWidget = InstagramPage('Instagram');
        break;
      case 'yt':
        pageWidget = YouTubePage('YouTube');
        break;
      case 'team':
        pageWidget = TeamPage('Team');
        break;
      case 'contact':
        pageWidget = ContactPage('Contact Us');
        break;
    }

    return pageWidget;
  }

  static List<TeamSocialLink> createSocialLinksForMember(List data) {
    var socialLinks = List<TeamSocialLink>();

    for(var i = 0; i < data.length; i++) {
      var s = data[i];
      socialLinks.add(TeamSocialLink(
        type: s["type"],
        value: s["value"]
      ));
    }

    return socialLinks;
  }

  static List<TeamMember> createTeamMembers(List data) {
    var members = List<TeamMember>();

    for(var i = 0; i < data.length; i++) {
      var m = data[i];
      members.add(
        TeamMember(
          name: m["name"],
          title: m["title"],
          subTitle: m["subTitle"],
          bio: m["bio"],
          imgPath: m["imgPath"],
          contactInfo: createSocialLinksForMember(m["contact"])
        )
      );
    }

    return members;
  }

  static List<ContactModel> createContacts(List data) {
    var contacts = List<ContactModel>();

    for(var i = 0; i < data.length; i++) {
      contacts.add(
        ContactModel(
          contactName: data[i]["contactName"],
          details: data[i]["details"],
          url: data[i]["url"],
          imgPath: data[i]["imgPath"],
        )
      );
    }

    return contacts;
  }

  static Widget getContactInfoRow(ContactModel currentModel, Function onContactInfoTapped) {
    return InkWell(
        onTap: () {
          onContactInfoTapped(currentModel);
        },
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Image.network(currentModel.imgPath, width: 60, height: 60),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(currentModel.contactName, 
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                        ),
                        Text(currentModel.details, 
                          style: TextStyle(color: Colors.blueAccent)
                        )
                      ],
                    ),
                  )
                ],
              )
            ),
            Divider(
            color: Colors.grey[300],
            height: 1,
          )
        ])
      );
  }

  static Widget getTeamMemberCard(TeamMember model, Function memberContactInfoTapped) {
    return Container(
        color: Colors.grey[300],
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipOval(child: Image.network(model.imgPath, width: 80, height: 80)),
                  Container(
                    width: 300,
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Column(
                      children: <Widget>[
                        Text(model.name,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                        ),
                        Text(model.title,
                          style: TextStyle(color: Colors.grey)
                        ),
                        Text(model.subTitle,
                          style: TextStyle(color: Utilities.googleGreen)
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(model.bio,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: getMemberContactPieces(model.contactInfo, memberContactInfoTapped))
                ],
              ),
            )
          ],
        ),
      );
          
  }

  static List<Widget> getMemberContactPieces(List<TeamSocialLink> socialMediaLinks, Function onContactInfoTapped) {
    var contactWidgets = List<Widget>();

    for(var i = 0; i < socialMediaLinks.length; i++) {

      var mediaLink = socialMediaLinks[i];

      contactWidgets.add(GestureDetector(
        onTap: () {
          onContactInfoTapped(mediaLink);
        },
        child: Image.asset('assets/contact_icons_${mediaLink.type}.png', width: 40, height: 40)
      ));
    }
    return contactWidgets;
  }

  static Widget getInstagramCell(InstagramEntry entry, Function onSelectedImage) {
    return GridTile(
      child: InkResponse(
        child: Image.network(entry.thumbnail, fit: BoxFit.cover),
        onTap: () => onSelectedImage(entry),
      )
      
    );
  }

  static Widget getResourceRowWidget(ResourceModel resource, Function onSelectedResource) {
    return InkWell(
      onTap: () {
        onSelectedResource(resource);
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.link, color: Utilities.themeBlue),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(resource.title,
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                        ),
                        Text(resource.description,
                          style: TextStyle(color: Colors.black)
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey[300],
            height: 1,
          )
        ],
      ),
    );
  }
}
