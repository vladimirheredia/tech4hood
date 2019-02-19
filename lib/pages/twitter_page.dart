import 'package:flutter/material.dart';
import '../shared/api.dart';
import 'dart:convert';
import '../models/tweet.dart';
import '../shared/utils.dart';

class TwitterPage extends StatefulWidget {
  final String title;

  TwitterPage(this.title);

  @override
  State<StatefulWidget> createState() {
    return TwitterPageState();
  }
}

class TwitterPageState extends State<TwitterPage> {
  List<Widget> tweets;

  //get all tweets call
  void _getTweets() {
    API.getAllTweets().then((response) {
      List<Tweet> _tweets = List<Tweet>();

      setState(() {
        var allTweets = json.decode(response.body);
        if (allTweets.keys.first == 'errors') return;
        tweets = List<Widget>();

        for (var item in allTweets) {
          _tweets.add(Tweet.fromJson(item));
        }

        for (var item in _tweets) {
          tweets.add(getTweetWidget(item));
        }
      });
    });
  }

  //helper method to return list of widgets
  List<Widget> getWidgets() {
    if (tweets.length > 0) {
      return tweets;
    }
    return List<Widget>();
  }

  @override
  void initState() {
    super.initState();
    //call to fetch the data
    _getTweets();
  }

  // Widget that formats the member's information
  Widget getTweetWidget(Tweet tweet) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(20),
              child: ListTile(
                title: Text(
                  tweet.created,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                subtitle: Text(tweet.description),
                leading: Icon(
                  Icons.description,
                  color: Colors.blue[500],
                ),
              )),
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
          backgroundColor: Utilities.blueThree,
          title: Text('Tweets'),
        ),
        body: Container(
          child: tweets != null
              ? tweets.length > 0
                  ? ListView(children: getWidgets())
                  : Center(child: CircularProgressIndicator())
              : Center(
                  child: Text('No items to show, try again later!'),
                ),
        ));
  }
}
