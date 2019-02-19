import 'package:flutter/material.dart';
import '../shared/utils.dart';
import '../models/event.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

class EventDetailsPage extends StatelessWidget {
  final Event _event;

  EventDetailsPage(this._event);

  // Return html viewer
  // and parse it from the description field
  HtmlView getDescription() {
    var descWords = _event.description.toString();

    return HtmlView(data: descWords);
  }

  //return event information
  Widget getEventDetail(Event event) {
    return Container(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Image.asset('assets/meetup_icon.png',
                          width: 50.0, height: 50.0, fit: BoxFit.contain)),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 250,
                          child: Text(
                            event.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        Text("Date: " + event.localDate),
                        Text(event.venueName),
                        Text(
                          event.venueAddress,
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          event.groupLocaltion,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 15,
            ),
            SingleChildScrollView(
                child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 100, maxHeight: 420),
                    child: ListView(
                      children: <Widget>[getDescription()],
                    ))),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Utilities.blueOne,
          title: Text('Event details'),
        ),
        body: Container(
          child: getEventDetail(_event),
        ));
  }
}
