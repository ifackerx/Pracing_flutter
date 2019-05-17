import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      //show list menu
      Card(
        color: Colors.white,
        child: Column(
          // จัดตำแหน่ง
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                // จัดแนวในนี้
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Icon(Icons.edit)),                  
                  Expanded(
                    flex: 6,
                    child: Text('Setting Your Account', style: TextStyle(fontSize: 20.0),)),
                
                ],
              ),

            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('ข้อมูลส่วนตัว'),
              subtitle: Text('จัดการข้อมูลส่วนตัวข้อผู้ใข้'),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),   
            ListTile(
              leading: Icon(Icons.vpn_key),
              title: Text('เปลี่ยนรหัสผ่าน'),
              subtitle: Text('จัดการข้อมูลส่วนตัวข้อผู้ใข้'),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ],
        )
      ),
    ],);
  }
}