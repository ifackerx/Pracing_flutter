import 'package:flutter/material.dart';

class AppScreen extends StatefulWidget {

  // ประกาศ type อะไรก็ได้
  var params;
  // กำหนด consturtor  โดยเอาชื่อลคาสมา
  AppScreen(this.params);

  @override
  _AppScreenState createState() => _AppScreenState(params); // ใส่ paramiter ด้วย
}

class _AppScreenState extends State<AppScreen> {
  
  var params;
  _AppScreenState(this.params);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add data Screen'),
      ),
      body: ListView(
        children: <Widget>[
          Text('$params'),
          Text('Add data', style: TextStyle(fontSize: 20.0),),
          RaisedButton(
            onPressed: () => Navigator.of(context).pop('OK DoNE!'),
            child: Text('Back'),
            color: Colors.pink[100],
            )
        ],
      ),
    );
  }
}