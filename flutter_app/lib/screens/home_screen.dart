import 'package:flutter/material.dart';
import 'page_one.dart';
import 'page_two.dart';
import 'page_three.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  
  Widget customBar = AppBar(
    title: Text('Home Screen main',
      style: TextStyle(fontSize: 30.0)
    ),
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
  
  TextStyle myStyle = TextStyle(
    fontSize: 20.0,
  );

  int _currentIndex = 0;
  // ชื่อไฟล์ page เข้ามาใส่
  List pages = [PageOne(), PageTwo(), PageThree()];

  @override
  Widget build(BuildContext context) {

    Widget customBottom = BottomNavigationBar(
        // ตัวหนดว่า index เท่าไหร่ page ไหน
        currentIndex: _currentIndex,
        onTap: (int index) {
          // assign ในนี้ ตัวข้างนอกก็จะไม่เปลี่ยนนะ ต้องใช้ set state
          setState(() {
            // ค่าจะ Refresh !
          _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('หน้าหลัก',style: TextStyle(fontSize: 20.0),)),
          BottomNavigationBarItem(icon : Icon(Icons.account_circle), title: Text('ข้อมูลส่วนตัว', style: myStyle,)),
          BottomNavigationBarItem(icon : Icon(Icons.settings), title: Text('ตั้งค่า', style: myStyle,)),
        ],

      );


    return Scaffold(
      appBar: customBar,
      body: pages[_currentIndex],
      floatingActionButton: customfloatingAction,
      bottomNavigationBar: customBottom,
    );
  }
}