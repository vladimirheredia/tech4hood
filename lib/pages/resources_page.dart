import 'dart:convert';
import 'package:tech4hood/pages/base_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:tech4hood/models/resources.dart';
import 'package:tech4hood/shared/api.dart';
import 'package:tech4hood/shared/utils.dart';

class ResourcesPage extends StatefulWidget with BasePageMixin {

  final String title;

  ResourcesPage(this.title);

  @override
  _ResourcesPageState createState() =>  _ResourcesPageState();

}

class _ResourcesPageState extends State<ResourcesPage> {
  List<Widget> resources = List<Widget>();

  void initState() {
    super.initState();

    API.getResources().then((response) {
      //get list of member objects
      List<ResourceModel> resourcesList = List<ResourceModel>();
      setState(() {
        //get list of members from api call
        var allMembers = json.decode(response.body);
        //create list of members
        for (var item in allMembers) {
            resourcesList.add(ResourceModel.fromJson(item));
        }
        //create list of widgets
        for (var item in resourcesList) {
          resources.add(Utilities.getResourceRowWidget(item, onSelectedResource));
        }
      });
    }).catchError((error) {
      setState(() {
        widget.errorNotification = 'There was a problem fetching resources information. Please try again.';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color.fromARGB(255, 18, 20, 61),
          
        ),
        body: Container(
          child: resources.length > 0
              ? ListView(children: resources)
              : widget.handleDataFetchingProgress(),
        ));
  }

  void onSelectedResource(ResourceModel resource) async {
    await launch(resource.link);
  }
}