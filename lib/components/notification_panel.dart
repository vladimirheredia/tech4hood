import 'package:flutter/material.dart';

class NotificationPanel extends StatelessWidget {

  String notificationMessage;

  NotificationPanel({ this.notificationMessage });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Column(
        children: <Widget>[
          Icon(Icons.warning, color: Colors.grey, size: 40),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(notificationMessage, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
          )
        ],
      ));
  }
}