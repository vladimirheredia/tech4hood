import 'package:flutter/material.dart';
import 'package:tech4hood/models/menu_item.dart';
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
                  Text('Learning HTML', style:TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14), textAlign: TextAlign.center),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text('asd kfjas;lk as ;kljsdf ;askfjs ;dfkjas ;dklfja s;fklasjf as;fkljas ;fj as;fkl asf;aklsjf as;fkljas f;adksjf as;fkljas',
                    style:TextStyle(fontSize: 12),
                    textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      children: <Widget>[
                        Text('Source', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Text('Udemy', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
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
                              width: 60,
                              child: Text('Badge / Certificate', style: TextStyle(color: Colors.grey, fontSize: 10), textAlign: TextAlign.center),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(Icons.alarm, color: Utilities.selectedTech.bgColor, size: 30),
                            Container(
                              width: 60,
                              child: Text('Approx. Completion Time', style: TextStyle(color: Colors.grey, fontSize: 10), textAlign: TextAlign.center),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(Icons.attach_money, color: Utilities.selectedTech.bgColor, size: 30),
                            Container(
                              width: 60,
                              child: Text('Free of Charge', style: TextStyle(color: Colors.grey, fontSize: 10), textAlign: TextAlign.center),
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
                      onPressed: () {},
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
          
        ),
        body:  Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
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
                      padding:EdgeInsets.only(top: 20, bottom: 20),
                      child: Text("Based on your selected choices, we recommend the following learning track. Tap on each step for more details.",
                      textAlign: TextAlign.center,
                      style:TextStyle(color: Colors.grey, fontSize: 12)),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _settingModalBottomSheet(context);
                      },
                      child: Container(
                        child: Stack(
                          children: <Widget>[
                            Container(
                                margin:EdgeInsets.only(left: 35),
                                color: index < 19 ? Utilities.selectedTech.bgColor : Colors.transparent,
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
                                  child: Text(index.toString(), textAlign: TextAlign.center, style:TextStyle(color: Colors.white))
                                )
                              ),
                              Container(
                                width: 250,
                                margin:EdgeInsets.only(left: 70),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Learning HTML", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                    Text("Basics of HTML Structure adskj ;asdjf adklsdf adsf adsf adsf adsf adf adsd adsf asdfas fadsf adsf adssf adsfj asd;fkljasf ;adksjf ;asfk ds and stuch", style: TextStyle(fontSize: 12)),
                                    Text("Source: Udemy", style:TextStyle(fontSize: 11, color: Colors.grey))
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
        )
      );
  }
}