import 'package:flutter/material.dart';
import 'dart:async';


class SplashPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
      
       Future.delayed(const Duration(milliseconds: 1000), () {
         Navigator.of(context).pushNamed('/home');
       });

    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 45, 92, 129),
      body:  Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/t4h_mobile_logo.png', width: 150.0, height: 100.0, fit: BoxFit.contain),
             Container(
              margin: const EdgeInsets.only(top: 20.0),
              child:  CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 255, 255, 255)),
                strokeWidth: 5.0
                )
            )
          ],
        ),
      ),
    );
    }
}