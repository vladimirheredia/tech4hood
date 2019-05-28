import 'dart:convert';
import 'package:tech4hood/models/learning_track.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:tech4hood/models/menu_item.dart';
import 'package:tech4hood/shared/api.dart';
import 'package:tech4hood/shared/utils.dart';

class TrackPage extends StatefulWidget {

  String title;

  TrackPage(String title, MenuItemModel selectedTechTrack) {
    this.title = title;
    Utilities.selectedTech = selectedTechTrack;
  }

  @override
  _TrackPageState createState() =>  _TrackPageState();

}

class _TrackPageState extends State<TrackPage> {

  List<LearningTrack> _learningTracks = List<LearningTrack>();
  LearningTrack _selectedLearningTrack;
  LearningResource _selectedLearningResource;
  bool isFetchingData = false;

  void initState() {
    super.initState();

    this.getLearningTrack();

  }

  void getLearningTrack() {
    isFetchingData = true;
    API.getLearningTrack(skill: Utilities.selectedTech.metadata, level: Utilities.selectedSkill.metadata).then((response) {

      setState(() {
        isFetchingData = false;
        var allLearningResources = json.decode(response.body);
        this.setupLearningTracks(allLearningResources);
      });
    });
  }

  void setupLearningTracks(dynamic learningResources) {
    _learningTracks = List<LearningTrack>();

    for (var item in learningResources) {
      
      var resource = LearningResource.fromJson(item);
      if (_learningTracks.any((t) => t.trackName == resource.tech)) {
        var foundTrack = _learningTracks.firstWhere((t) => t.trackName == resource.tech);
        if (foundTrack != null) {
          foundTrack.learningResources.add(resource);
        }
      }
      else {
        var learningTrack = LearningTrack(trackName: resource.tech);
        learningTrack.learningResources.add(resource);
        _learningTracks.add(learningTrack);
      }
    }

    _selectedLearningTrack = _learningTracks.length > 0 ? _learningTracks.first : null;
    _selectedLearningResource = _selectedLearningTrack != null ? _selectedLearningTrack.learningResources.first : null;
  }

  List<Widget> learningTrackTabs() {
    List<Widget> trackTabs = List<Widget>();

    for(var track in _learningTracks) {
      trackTabs.add(
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                _selectedLearningTrack = track;
              });
            },
            child: Container(
              margin:EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                border: Border.all(color:Utilities.selectedTech.bgColor, width: 2),
                color: _selectedLearningTrack.trackName == track.trackName ? Utilities.selectedTech.bgColor : Colors.transparent
              ),
              padding: EdgeInsets.all(10),
              child: Text(track.trackName, textAlign: TextAlign.center, 
                style:TextStyle(color: _selectedLearningTrack.trackName == track.trackName ? Colors.white : Utilities.selectedTech.bgColor, 
                fontSize: 12))
            ),
          ),
          flex: 1,
        ));
    }

    return trackTabs;
  }

  void _settingModalBottomSheet(context){
      showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
            return Container(
              padding:EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    padding: EdgeInsets.all(10),
                    margin:EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Utilities.selectedTech.bgColor,
                      shape: BoxShape.circle
                    ),
                    child: Image.asset('assets/' + Utilities.selectedTech.image, width: 50),
                  ),
                  Text(_selectedLearningResource.title, style:TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14), textAlign: TextAlign.center),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(_selectedLearningResource.description,
                    style:TextStyle(fontSize: 12),
                    textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      children: <Widget>[
                        Text('Source', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Text(_selectedLearningResource.source, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                      ],
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(Icons.verified_user, color: Utilities.selectedTech.bgColor, size: 30),
                            Container(
                              width: 80,
                              child: Text(_selectedLearningResource.certificateBadge ? 'Badge / Cert.' : 'No Badge / Cert.', style: TextStyle(color: Colors.grey, fontSize: 10), textAlign: TextAlign.center),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(Icons.alarm, color: Utilities.selectedTech.bgColor, size: 30),
                            Container(
                              width: 80,
                              child: Text(_selectedLearningResource.length == '—-' ? 'Not specified' : (_selectedLearningResource.length + ' aprox. completion time'), style: TextStyle(color: Colors.grey, fontSize: 10), textAlign: TextAlign.center),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(Icons.attach_money, color: Utilities.selectedTech.bgColor, size: 30),
                            Container(
                              width: 80,
                              child: Text(_selectedLearningResource.price, style: TextStyle(color: Colors.grey, fontSize: 10), textAlign: TextAlign.center),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      color: Utilities.selectedTech.bgColor,
                      child: Container(
                        child: Text('Go to Source', style: TextStyle(color: Colors.white)),
                      ),
                      onPressed: ()async {
                        await launch(_selectedLearningResource.link);
                      },
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                    ),
                  )
                ],
              )
            );
        }
      );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey),
          title: Text("Your Learning Track", style: TextStyle(color: Colors.grey)),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).popUntil(ModalRoute.withName('/home'));
              },
            ),
          ],
          
        ),
        body: _selectedLearningTrack != null ?  Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                          padding:EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 60,
                                height: 60,
                                padding: EdgeInsets.all(10),
                                margin:EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: Utilities.selectedSkill.bgColor,
                                  shape: BoxShape.circle
                                ),
                                child: Image.asset('assets/' + Utilities.selectedSkill.image, width: 50),
                              ),
                              Text("Skill Level:", style:TextStyle(color: Colors.grey, fontSize: 12)),
                              Text(Utilities.selectedSkill.label, style:TextStyle(color: Utilities.selectedSkill.bgColor, fontWeight: FontWeight.bold, fontSize: 15))
                            ],
                          )
                        ),
                        Padding(
                          padding:EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 60,
                                height: 60,
                                padding: EdgeInsets.all(10),
                                margin:EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: Utilities.selectedTech.bgColor,
                                  shape: BoxShape.circle
                                ),
                                child: Image.asset('assets/' + Utilities.selectedTech.image, width: 50),
                              ),
                              Text("Technology Track:", style:TextStyle(color: Colors.grey, fontSize: 12)),
                              Text(Utilities.selectedTech.label, style:TextStyle(color: Utilities.selectedTech.bgColor, fontWeight: FontWeight.bold, fontSize: 15))
                            ],
                          )
                        ),
                      ],
                    ),
                    Padding(
                      padding:EdgeInsets.only(top: 20, bottom: 5),
                      child: Text("Based on your selected choices, we recommend the following learning track. Tap on each step for more details.",
                      textAlign: TextAlign.center,
                      style:TextStyle(color: Colors.grey, fontSize: 12)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text(_learningTracks.length.toString() + " tracks available", textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: Utilities.selectedTech.bgColor)),
                    Row(
                      children: learningTrackTabs(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _selectedLearningTrack.learningResources.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _selectedLearningResource = _selectedLearningTrack.learningResources[index];
                        _settingModalBottomSheet(context);
                      },
                      child: Container(
                        child: Stack(
                          children: <Widget>[
                            Container(
                                margin:EdgeInsets.only(left: 35),
                                color: index < _selectedLearningTrack.learningResources.length - 1 ? Utilities.selectedTech.bgColor : Colors.transparent,
                                width: 5,
                                height: 120,
                                padding: EdgeInsets.only(left: 40),
                              ),
                            Container(
                                margin:EdgeInsets.only(left: 16.5),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Utilities.selectedTech.bgColor,
                                  shape: BoxShape.circle
                                ),
                                child: Center(
                                  child: Text((index + 1).toString(), textAlign: TextAlign.center, style:TextStyle(color: Colors.white))
                                )
                              ),
                              Container(
                                width: 250,
                                margin:EdgeInsets.only(left: 70),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(_selectedLearningTrack.learningResources[index].title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                    Text(_selectedLearningTrack.learningResources[index].description, style: TextStyle(fontSize: 12)),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text("Source: " + _selectedLearningTrack.learningResources[index].source, style:TextStyle(fontSize: 11, color: Colors.grey))
                                    )
                                  ],
                                ),
                              )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ) : (isFetchingData ? Center(
          child: CircularProgressIndicator(backgroundColor: Utilities.selectedSkill.bgColor)
        ) : Container(
              padding: EdgeInsets.all(50),
              color: Colors.white,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      child: Icon(Icons.warning, color: Colors.grey),
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Text('There are no available learning tracks for this skill and level at the moment. Please try another skill / level.', textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey))
                  ],
                ),
              )
            )
          )
      );
  }
}