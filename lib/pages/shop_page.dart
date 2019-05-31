import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tech4hood/models/shopentry.dart';
import 'package:tech4hood/pages/base_page.dart';
import 'package:tech4hood/shared/api.dart';
import 'package:tech4hood/shared/utils.dart';
import 'package:xml/xml.dart' as xml;
import 'package:xml/xml.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopPage extends StatefulWidget with BasePageMixin {

  final String title;

  ShopPage(this.title);

  @override
  _ShopPageState createState() =>  _ShopPageState();

}

class _ShopPageState extends State<ShopPage> {
  List<Widget> resources = List<Widget>();

  List<ShopEntry> allProductsList = List<ShopEntry>();

  void initState() {
    super.initState();

    API.getT4HShop().then((response) {
      //get list of member objects
      setState(() {
        //get list of members from api call
        var allProducts = json.decode(response.body);
        //create list of members
        for (var item in allProducts["articles"]["article"]) {
            allProductsList.add(ShopEntry.fromJson(item));
        }
      });
    }).catchError((error) {
      setState(() {
        widget.errorNotification = 'There was a problem fetching data from the shop. Please try again.';
      });
    });
  }

  void onLaunchShop() async {
    await launch('https://shop.spreadshirt.com/tech4hood');
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Utilities.shopBlue,
          
        ),
        body: Container(
          child: allProductsList.length > 0
              ? Stack(
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                            itemCount: allProductsList.length,
                            itemBuilder: (context, index) {
                              return Utilities.getShopEntries(allProductsList[index]);
                            },
                          )
                        ),
                        Container(
                          margin:EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(bottom: 30, left: 20, right: 20),
                          child: RaisedButton(
                            color: Color(0xff00b2a5),
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                            onPressed: () {
                              onLaunchShop();
                            },
                            child: Container(
                              padding:EdgeInsets.all(20),
                              child: Text("Shop at Spreadshirt.com", style:TextStyle(color: Colors.white, fontSize: 18)),
                            )
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    child: Image.asset('assets/spreadshirt_logo.png', width: 70),
                    left: 10,
                  )
                ],
              )
              : widget.handleDataFetchingProgress(),
        ));
  }
}