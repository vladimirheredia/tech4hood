import 'package:flutter/material.dart';

class MediaPage extends StatefulWidget {

  final String title;

  MediaPage(this.title);

  @override
  _MediaPageState createState() =>  _MediaPageState();

}

class _MediaPageState extends State<MediaPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color.fromARGB(255, 18, 20, 61),
          
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