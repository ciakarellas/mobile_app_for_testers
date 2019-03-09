import 'package:flutter/material.dart';
import './ibanGeneratorWidget.dart';

class MyApp extends StatelessWidget {
  

  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Tester app'),
          backgroundColor: Colors.indigo[800],
        ),
        body: ListView(
          children: <Widget>[
            IbanWidget(),
          ],
          ),
        ),
      );
  }
}