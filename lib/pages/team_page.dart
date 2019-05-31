import 'dart:convert';
import 'package:tech4hood/pages/base_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:tech4hood/models/team_member.dart';
import 'package:tech4hood/shared/api.dart';
import 'package:tech4hood/shared/utils.dart';

class TeamPage extends StatefulWidget with BasePageMixin {
  final String title;

  TeamPage(this.title);

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  List<Widget> teamCards = List<Widget>();

  void initState() {
    super.initState();

    API.getTech4HoodTeam().then((response) {
      //get list of member objects
      setState(() {
        //get list of members from api call
        var allMembers = json.decode(response.body);

        var teamMembersList = Utilities.createTeamMembers(allMembers);

        //create list of widgets
        for (var item in teamMembersList) {
          teamCards.add(Utilities.getTeamMemberCard(item, onSelectedResource));
        }
      });
    }).catchError((error) {
      setState(() {
        widget.errorNotification = 'There was a problem fetching team information. Please try again.';
      });
    });
  }

  void onSelectedResource(TeamSocialLink resource) async {
    await launch(resource.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.title), backgroundColor: Utilities.googleGreen),
        body: Container(
          color: Colors.grey[300],
          child: teamCards.length > 0
              ? ListView(children: teamCards)
              : widget.handleDataFetchingProgress(),
        ));
  }
}
