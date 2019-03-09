import 'package:flutter/material.dart';
import '../shared/utils.dart';
import '../models/event.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:intl/intl.dart';

class EventDetailsPage extends StatelessWidget {
  final Event _event;
  bool isFuture;

  EventDetailsPage(this._event, this.isFuture);

  //return event information
  Widget getEventDetail(Event event) {
    return Container(
        color: Colors.white,
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
                      child: Image.asset('assets/meetup_logo.png',
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
                        Text("Date: " + DateFormat.yMMMd('en_US').format(DateTime.parse(event.localDate))),
                        Text(event.venueName),
                        Text(
                          event.venueAddress,
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          event.groupLocation,
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
            Container(
              child: Column(
                children: <Widget>[
                  isFuture ? Column(
                    children: <Widget>[
                    Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 5),
                    child: Text("Share QRCode Below", style:TextStyle(color: Colors.grey, fontSize: 11)),
                  ),
                  Padding(padding: EdgeInsets.all(20), 
                  child: 
                    Container(padding: EdgeInsets.all(10),
                    child: QrImage(data:event.link, size: 200),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(color: Colors.grey[300], blurRadius: 10, offset: Offset.zero)
                        ]
                      ),
                      )
                    )
                  ]) : Center(child: Text('This event has passed already.', style:TextStyle(fontSize: 14, color: Colors.grey))),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      color: isFuture ? Utilities.googleRed : Colors.grey,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Image.asset('assets/meetup_logo_white.png', width: 40, height: 40)
                            ),
                            Text(isFuture ? "Go to Meetup Page To Register" : "View this past event",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      onPressed: () async {
                        await launch(event.link);
                      },
                    ),
                  )]
              )
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: isFuture ? FloatingActionButton(
        backgroundColor: Utilities.googleRed,
        child: Icon(Icons.share, color: Colors.white),
        onPressed: () {
          Share.share(_event.link);
        },
      ) : null,
        appBar: AppBar(
          backgroundColor: Utilities.blueOne,
          title: Text('Event details'),
        ),
        body: Container(
          color: Colors.white,
          child: getEventDetail(_event),
        ));
  }
}
