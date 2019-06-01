import 'package:flutter/material.dart';
import 'package:tech4hood/components/notification_panel.dart';
import 'package:tech4hood/pages/base_page.dart';
import '../models/member.dart';
import '../shared/api.dart';
import 'dart:convert';
import '../shared/utils.dart';

class MembersPage extends StatefulWidget with BasePageMixin {
  final String title;

  MembersPage(this.title);

  @override
  State<StatefulWidget> createState() {
    return MembersPageState();
  }
}

class MembersPageState extends State<MembersPage> {
  List<Widget> members = List<Widget>();

  // gets all members
  void _getAllMembers() {
    API.getAllMembers().then((response) {
      //get list of member objects
      List<Member> memlist = List<Member>();
      if (mounted) {
        setState(() {
          //get list of members from api call
          var allMembers = json.decode(response.body);
          //create list of members
          for (var item in allMembers) {
            if (item['photo'] != null) {
              memlist.add(Member.fromJson(item));
            }
          }
          //create list of widgets
          for (var item in memlist) {
            members.add(getMemberWidget(item));
          }
        });
      }
    }).catchError((error) {
      if (mounted) {
        setState(() {
          widget.errorNotification = 'There was a problem fetching members information. Please try again.';
        });
      }
    });
  }

  //helper method to return list of widgets
  List<Widget> getWidgets() {
    if (members.length > 0) {
      return members;
    }
    return List<Widget>();
  }

  void initState() {
    super.initState();
    _getAllMembers();
  }

  // Widget that formats the member's information
  Widget getMemberWidget(Member member) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Container(
                      color: Colors.grey[300],
                      width: 80,
                      height: 80,
                      child: Image.network(member.photo)),
                ),
                Padding(
                    padding:
                        EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(member.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Text(member.status,
                            style: TextStyle(color: Colors.grey)),
                        Text(
                            "${member.city} ${member.state} (${member.country})",
                            style: TextStyle(color: Utilities.blueOne))
                      ],
                    ))
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Utilities.blueOne,
          title: Text(widget.title),
        ),
        body: Container(
          child: members.length > 0
              ? ListView(children: getWidgets())
              : widget.handleDataFetchingProgress()
        ));
  }
}
