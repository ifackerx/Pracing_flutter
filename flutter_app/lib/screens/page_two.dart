import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
      // กำหนด ตำแหน่ง
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image(image: AssetImage('asset/img/profile.jpg')),
        Container(height: 100.0, color: Colors.pink),
        Image(image: AssetImage('asset/img/profile.jpg')),

        Row(
          children: <Widget>[
            // ถ้าใช้ Row ภายใจ้ widget ตัวอื่นต้อง expand
            Expanded(
             child: Container(
                height: 100.0,
                color: Colors.pink[50],
              ),
            ),
            Expanded(
             child: Image(
               // ทำให้รูปเต็มช่อง
               fit : BoxFit.fill,
               height: 100.0,
               image: AssetImage('asset/img/profile.jpg')),

            )
          
          ],
        )
      ],
    ),
      ],);
  }
}