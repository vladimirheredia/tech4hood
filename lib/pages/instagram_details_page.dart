import 'package:flutter/material.dart';
import 'package:tech4hood/models/instagram_entry.dart';
import 'package:tech4hood/shared/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class InstagramDetailsPage extends StatefulWidget {

  final String title;
  final InstagramEntry entry;

  InstagramDetailsPage(this.title, this.entry);

  @override
  _InstagramDetailsPageState createState() =>  _InstagramDetailsPageState();

}

class _InstagramDetailsPageState extends State<InstagramDetailsPage> {

  void onSelectedResource(InstagramEntry entry) async {
    await launch(entry.link);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Utilities.instagramColor,
          
        ),
        body:  Container(
          child: Column(
            children: <Widget>[
              Container(
                width: 600,
                height: 300,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: NetworkImage(widget.entry.thumbnail),
                    fit: BoxFit.cover,
                  ),
                )
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          child: ClipOval(
                            child: Image.network(widget.entry.userProfilePic),
                          ),
                        ),
                        Container(
                          width: 300,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(DateFormat.MMMMEEEEd('en_US').format(DateTime.parse(widget.entry.createdTime)), 
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                ),
                                Text(widget.entry.caption, style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 50, right: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.favorite, color: Colors.red, size: 30),
                              Container(
                                margin:EdgeInsets.only(left: 10),
                                child: Text(widget.entry.likes.toString(), style:TextStyle(fontSize: 20)),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.comment, color: Colors.lightBlueAccent,  size: 30),
                              Container(
                                margin:EdgeInsets.only(left: 10),
                                child: Text(widget.entry.comments.toString(), style:TextStyle(fontSize: 20)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          RaisedButton(
                            color: Utilities.instagramColor,
                            child: Container(
                              padding: EdgeInsets.only(top: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset('assets/social_instagram.png', width: 25,),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text('View on Instagram', style: TextStyle(color: Colors.white, fontSize: 20)),
                                  )
                                ],
                              ),
                            ),
                            onPressed:  () {
                              onSelectedResource(widget.entry);
                            },
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      );
  }
}