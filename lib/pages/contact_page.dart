import 'dart:convert';
import 'package:tech4hood/models/contact_model.dart';
import 'package:tech4hood/pages/base_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:tech4hood/shared/api.dart';
import 'package:tech4hood/shared/utils.dart';

class ContactPage extends StatefulWidget with BasePageMixin {
  final String title;

  ContactPage(this.title);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<Widget> contactItems = List<Widget>();

  void initState() {
    super.initState();

    API.getContactInfo().then((response) {
      //get list of member objects
      setState(() {
        //get list of members from api call
        var allContacts = json.decode(response.body);

        var contactsList = Utilities.createContacts(allContacts);

        //create list of widgets
        for (var item in contactsList) {
          contactItems.add(Utilities.getContactInfoRow(item, onSelectedResource));
        }
      });
    }).catchError((error) {
      setState(() {
        widget.errorNotification = 'There was a problem fetching contact information. Please try again';
      });
    });
  }

  void onSelectedResource(ContactModel resource) async {
    await launch(resource.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.title), backgroundColor: Utilities.themeBlue),
        body: Container(
          child: contactItems.length > 0
              ? ListView(children: contactItems)
              : widget.handleDataFetchingProgress(),
        ));
  }
}
