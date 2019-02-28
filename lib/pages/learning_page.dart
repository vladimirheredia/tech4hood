import 'package:flutter/material.dart';

class LearningPage extends StatefulWidget {

  final String title;

  LearningPage(this.title);

  @override
  _LearningPageState createState() =>  _LearningPageState();

}

class _LearningPageState extends State<LearningPage> {
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