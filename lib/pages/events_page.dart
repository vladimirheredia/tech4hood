import 'package:flutter/material.dart';
import 'package:tech4hood/components/notification_panel.dart';
import 'package:tech4hood/pages/base_page.dart';
import '../shared/utils.dart';
import '../models/event.dart';
import '../shared/api.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import '../pages/event_details_page.dart';

class EventsPage extends StatefulWidget with BasePageMixin {
  final String title;
  EventsPage(this.title);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  //method that calls the past events
  List<Event> pastEvents = List<Event>();
  List<Event> futureEvents= List<Event>();

  void _getAllEvents() {
    API.getAllEvents().then((response) {
      if (mounted) {
          setState(() {
          var allEvents = json.decode(response.body);
          Iterable listPast = allEvents['pastEvents'];
          Iterable listFuture = allEvents['upcomingEvents'];

          pastEvents = listPast.map((model) => Event.fromJson(model)).toList();
          futureEvents =
              listFuture.map((model) => Event.fromJson(model)).toList();
        });
      }
    }).catchError((error) {
      if (mounted) {
          setState(() {
          widget.errorNotification = 'There was a problem fetching event information. Please try again.';
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    //call to fetch the data
    _getAllEvents();
  }

  //get list of events
  Widget _getListOfEvents(List<Event> events, bool isFuture) {
    return ListView.builder(
      itemCount: events == null ? 0 : events.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EventDetailsPage(events[index], isFuture)),
            );
          },
          child: Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Icon(
                            Icons.calendar_today,
                            color: Utilities.blueTwo,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 250,
                                child: Text(
                                  events[index].name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              Text("Date: " + DateFormat.yMMMd('en_US').format(DateTime.parse(events[index].localDate))),
                              Text(events[index].venueName),
                              Text(
                                events[index].venueAddress,
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                events[index].groupLocation,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[300],
                    height: 1,
                  )
                ],
              )
              ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Utilities.blueOne,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.calendar_today),
                text: 'Past events',
              ),
              Tab(icon: Icon(Icons.date_range), text: 'Future events'),
            ],
          ),
          title: Text(widget.title),
        ),
        body: (pastEvents.length > 0)
            ? TabBarView(
                children: [
                  // tab 1 content
                  pastEvents.length > 0
                      ? _getListOfEvents(pastEvents, false)
                      : Center(
                          child: Text("There's no data!", style: TextStyle(fontSize: 18)),
                        ),

                  // tab 2 content
                  futureEvents.length > 0
                      ? _getListOfEvents(futureEvents, true)
                      : Center(
                          child: Text(
                            "Ther's no future events yet!",
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                ],
              )
            : widget.handleDataFetchingProgress()
      ),
    );
  }
}
