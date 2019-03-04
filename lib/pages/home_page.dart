import 'package:flutter/material.dart';
import 'package:tech4hood/models/menu_item.dart';
import '../shared/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {

   final String title;

   HomePage(this.title);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
  @override
  Widget build(BuildContext context) {

    List<MenuItemModel> menus = Utilities.getMenuItems();
    
    return  Scaffold(
      drawer: Container(
        padding: EdgeInsets.only(top: 50.0),
        color: Colors.black.withOpacity(0.6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin:EdgeInsets.only(top: 20, bottom: 20),
                  child: Image.asset('assets/t4h_cloud_logo.png', width: 100),
                ),
                InkWell(
                  onTap: () {
                    goToContactPage();
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 25, top: 30),
                    width: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.contacts, color: Colors.white),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text("Contact Us", style:TextStyle(color: Colors.white))
                        )
                      ],
                    ),
                  )
                ),
                InkWell(
                  onTap: () {
                    goToLink('http:www.tech4hood.org');
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 25, top: 30),
                    width: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.link, color: Colors.white),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text("Visit our Website", style:TextStyle(color: Colors.white))
                        )
                      ],
                    ),
                  )
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: GestureDetector(
                onTap: () {
                  goToLink('http:www.drcoderz.com');
                },
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/drc_logo_bottom.png', width: 50),
                    Container(
                      margin:EdgeInsets.only(top: 20),
                      width: 100,
                      child: Text('Powered by DRCoderz.com', style:TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                    )
                  ]
                ),
              ),
            )
          ]
        )
      ),
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          title: Image.asset('assets/t4h_full_logo.png', width:150),
          backgroundColor: Utilities.themeBlue
        ),
        body:  Container(
          color: Utilities.themeBlue,
          child: ListView.builder(
            itemCount: menus.length,
            itemBuilder: (context, index) {
              return Utilities.getSingleMenuItemWidget(context, menus[index]);
            },
          ),
        )
      );
  }

  void goToContactPage() {
    Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Utilities.getPageFromId('contact')),
            );
  }

  void goToLink(String link) async {
    await launch(link);
  }
}