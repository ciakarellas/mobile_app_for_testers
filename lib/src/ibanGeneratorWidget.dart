import 'package:flutter/material.dart';
import './ibanGenerator.dart';

class IbanWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return IbanWidgetState();
  }
}

class IbanWidgetState extends State<IbanWidget>{
  var _ibanNumber = new GenerateIbanNumber(16, '252100');
  String _iban ='';

  Widget build(context){
    // I decide make container instead single row because below text field i want to add two btn 'generate' and 'copy'
    // TODO: add below text two btn 'generate' and 'copy'
    return Container(
      padding: EdgeInsets.all(28.0),
      child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('$_iban', textAlign: TextAlign.end),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        child: Text('Generate'),
                        onPressed: (){
                          setState(() {
                           this._iban = this._ibanNumber.generateIbanNumber(); 
                          });
                        },
                        color: Colors.indigo[400],
                        ),
                        RaisedButton(
                          child: Text('Copy'),
                          onPressed: (){
                          setState(() {
                            
                          });
                        },
                        color: Colors.grey[400],
                        )
                    ],
                  )
                ],
              ),
    );
  }
}