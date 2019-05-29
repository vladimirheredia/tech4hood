import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tech4hood/models/youtubevideo_model.dart';
import 'package:tech4hood/pages/youtube_player_page.dart';
import 'package:tech4hood/shared/api.dart';
import 'package:tech4hood/shared/utils.dart';

class YouTubePage extends StatefulWidget {

  final String title;

  YouTubePage(this.title);

  @override
  _YouTubePageState createState() =>  _YouTubePageState();

}

class _YouTubePageState extends State<YouTubePage> {

  List<YouTubeVideoModel> youtubeVideos = List<YouTubeVideoModel>();
  bool isFetchingData;

  void initState() {
    super.initState();

    this.getYouTubeVideos();
  }

  void getYouTubeVideos() {
    isFetchingData = true;
    API.getYoutubeVideos().then((response) {

      setState(() {

        isFetchingData = false;
        //get list of videos from api call
        var allVideos = json.decode(response.body);
        //populate list of videos
        for (var item in allVideos) {
            youtubeVideos.add(YouTubeVideoModel.fromJson(item));
        }
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Utilities.youtubeRed,
          
        ),
        body: youtubeVideos.length > 0 ?  ListView.builder(
          itemCount: youtubeVideos.length,
          itemBuilder:  (context, index) {
            var youtubeVideo = youtubeVideos[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YouTubePlayerPage(videoModel: youtubeVideos[index]),
                ));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(youtubeVideo.thumbnailPath, width: 100, height: 100),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 220,
                            child: Text(youtubeVideo.title, 
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            width: 220,
                            child: Text(youtubeVideo.description, 
                            style: TextStyle(fontSize: 12)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        ) : Center(
          child: CircularProgressIndicator(),
        )
      );
  }
}