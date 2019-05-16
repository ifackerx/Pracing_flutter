import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  
  Widget customBar = AppBar(
    title: Text('HOME SCREEN PAGE'),
    backgroundColor: Colors.pink[100],
    // ปุ่มซ้ายขวา
    actions: <Widget>[
      IconButton(icon: Icon(Icons.home), onPressed: () {}),
      IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
    ],
  );

  Widget customfloatingAction = FloatingActionButton(
    onPressed: () {},
    backgroundColor: Colors.pink[100],
    child: Icon(Icons.add),
    );
  
  Widget customBottom = BottomNavigationBar(
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('หน้าหลัก')),
      BottomNavigationBarItem(icon : Icon(Icons.account_circle), title: Text('ข้อมูลส่วนตัว')),
      BottomNavigationBarItem(icon : Icon(Icons.settings), title: Text('ตั้งค่า')),
    
    ],

  );

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBar,
      body: Center(
        child: Text('HOMESCREEN'),
      ),
      floatingActionButton: customfloatingAction,
      bottomNavigationBar: customBottom,
    );
  }
}