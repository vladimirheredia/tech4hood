import 'package:flutter/material.dart';

class YouTubePage extends StatefulWidget {

  final String title;

  YouTubePage(this.title);

  @override
  _YouTubePageState createState() =>  _YouTubePageState();

}

class _YouTubePageState extends State<YouTubePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color.fromARGB(255, 233, 25, 33),
          
        ),
        body:  ListView(
          shrinkWrap: true,
          children: <Text>[
            Text('hello World', style:  TextStyle(color: Colors.black)),
          ]
        )
      );
  }
}