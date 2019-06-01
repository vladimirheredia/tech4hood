import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tech4hood/models/instagram_entry.dart';
import 'package:tech4hood/pages/base_page.dart';
import 'package:tech4hood/pages/instagram_details_page.dart';
import 'package:tech4hood/shared/api.dart';
import 'package:tech4hood/shared/utils.dart';

class InstagramPage extends StatefulWidget with BasePageMixin {
  final String title;
  
  InstagramPage(this.title);

  @override
  _InstagramPageState createState() => _InstagramPageState();
}

class _InstagramPageState extends State<InstagramPage> {
  List<Widget> instagramImages = new List<Widget>();
  BuildContext _context;

  void initState() {
    super.initState();

    API.getInstagramFeed().then((response) {
      //get list of member objects
      List<InstagramEntry> instagramList = List<InstagramEntry>();

      if (mounted) {
        setState(() {
          //get list of members from api call
          var allInstagramEntries = json.decode(response.body);
          //create list of members
          for (var item in allInstagramEntries['data']) {
            instagramList.add(InstagramEntry.fromJson(item));
          }
          //create list of widgets
          for (var item in instagramList) {
            instagramImages
                .add(Utilities.getInstagramCell(item, onSelectedInstagramImage));
          }
        });
      }
    }).catchError((error) {
      if (mounted) {
        setState(() {
          widget.errorNotification = 'There was a problem fetching Instagram information. Please try again.';
        });
      }
    });
  }

  void onSelectedInstagramImage(InstagramEntry instEntry) {
    Navigator.push(
              _context,
              MaterialPageRoute(
                  builder: (_context) =>
                      InstagramDetailsPage('Details', instEntry),
            ));
  }

  @override
  Widget build(BuildContext context) {

    _context = context;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Utilities.instagramColor,
        ),
        body: Container(
          child: instagramImages.length > 0
              ? GridView.extent(
                  maxCrossAxisExtent: 220,
                  children: instagramImages,
                )
              : widget.handleDataFetchingProgress(),
        ));
  }
}
