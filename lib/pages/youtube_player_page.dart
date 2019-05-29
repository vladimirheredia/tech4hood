import 'package:flutter/material.dart';
import 'package:tech4hood/models/youtubevideo_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tech4hood/shared/utils.dart';
import 'package:share/share.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayerPage extends StatefulWidget {

  String youtubeUrl = 'https://youtube.com/watch?v=';
  YouTubeVideoModel videoModel;

  YouTubePlayerPage({ this.videoModel });

  @override
  YouTubePlayerPageState createState() =>  YouTubePlayerPageState();

}

class YouTubePlayerPageState extends State<YouTubePlayerPage> {

  YoutubePlayerController _controller = YoutubePlayerController();

  @override
  void dispose() {
    // This pauses video while navigating to next page.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Details'),
        backgroundColor: Utilities.youtubeRed,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            YoutubePlayer(
              context: context,
              videoId: widget.videoModel.videoId,
              autoPlay: true,
              showVideoProgressIndicator: true,
              videoProgressIndicatorColor: Colors.amber,
              progressColors: ProgressColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              )
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.videoModel.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      SizedBox(height: 20),
                      Text(widget.videoModel.description),
                      SizedBox(height: 50),
                      RaisedButton(
                        color: Utilities.googleBlue,
                        child: Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.share, color: Colors.white, size: 25),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('Share Video', style: TextStyle(color: Colors.white, fontSize: 20)),
                              )
                            ],
                          ),
                        ),
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () {
                          Share.share(widget.youtubeUrl + widget.videoModel.videoId);
                        }),
                        SizedBox(height: 10),
                        RaisedButton(
                        color: Utilities.youtubeRed,
                        child: Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('assets/social_youtube.png', width: 25),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('View on YouTube', style: TextStyle(color: Colors.white, fontSize: 20)),
                              )
                            ],
                          ),
                        ),
                        onPressed: () async {
                          await launch(widget.youtubeUrl + widget.videoModel.videoId);
                        },
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }

}
