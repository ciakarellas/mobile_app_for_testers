import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
          'data',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold)
          ),
        )
      )
    );
  }
}