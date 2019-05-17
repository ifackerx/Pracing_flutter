import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/screens/app_screen.dart';
import 'page_one.dart';
import 'page_two.dart';
import 'page_three.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  
  
  
  TextStyle myStyle = TextStyle(
    fontSize: 20.0,
  );

  int _currentIndex = 0;
  // ชื่อไฟล์ page เข้ามาใส่
  List pages = [PageOne(), PageTwo(), PageThree()];

  bool hasImage = true;


  @override
  Widget build(BuildContext context) {

    Widget customBar = AppBar(
    title: Text('Home Screen main',
      style: TextStyle(fontSize: 30.0)
    ),
    backgroundColor: Colors.pink[100],
    // ปุ่มซ้ายขวา
    actions: <Widget>[
      IconButton(icon: Icon(Icons.home), onPressed: () {}),
      IconButton(icon: Icon(Icons.account_circle), onPressed: () => Navigator.of(context).pushNamed('/one')),
    ],
  );

  

    Widget customfloatingAction = FloatingActionButton(
    onPressed: () async {
      // กดปุ่มเปลี่ยนหน้า Async Await อยู่ด้วยกัน ไม่มีก็ได้
      var response = await Navigator.push(context, MaterialPageRoute(builder: (context) => AppScreen('hellow hell')));
      print(response);
    },
    backgroundColor: Colors.pink[100],
    child: Icon(Icons.add),
    );


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

    Widget drawer = Drawer(
  // Add a ListView to the drawer. This ensures the user can scroll
  // through the options in the Drawer if there isn't enough vertical
  // space to fit everything.
  child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: <Widget>[
      UserAccountsDrawerHeader(
        currentAccountPicture: hasImage ? CircleAvatar(
          backgroundColor: Colors.white,
          // backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/22.jpg'),
          backgroundImage: AssetImage('asset/img/profile.jpg')
          // child: Text('THX', style: TextStyle(fontSize: 20.0, color: Colors.black)),
        ) : CircleAvatar(
          child: Text('THX', style: TextStyle(fontSize: 20.0, color: Colors.black)),
        
        ),
        accountName: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text('Thong-ngurn'),
        ),
        accountEmail: Text('ifackerx@gmail.com'),
        decoration: BoxDecoration(
          color: Colors.pink[100],
          image: DecorationImage(fit: BoxFit.fill,image: AssetImage('asset/img/profile.jpg'))
          )
      ),
      ListTile(
        // icon เป็น img เป็น  text ก็ได้
        leading: Icon(Icons.home),
        title: Text('Main Screen', style: TextStyle(fontSize: 20.0),),
        trailing: Icon(Icons.keyboard_arrow_right),
        subtitle: Text('iphonex'),
        onTap: () {
          // Update the state of the app
        },
      ),
       ListTile(
        // icon เป็น img เป็น  text ก็ได้
        leading: Icon(Icons.account_circle),
        title: Text('User Profile', style: TextStyle(fontSize: 20.0),),
        trailing: Icon(Icons.keyboard_arrow_right),
        subtitle: Text('iphonex'),
        onTap: () {
          // Update the state of the app
        },
      ),
       ListTile(
        // icon เป็น img เป็น  text ก็ได้
        leading: Icon(Icons.settings),
        title: Text('Setting', style: TextStyle(fontSize: 20.0),),
        trailing: Icon(Icons.keyboard_arrow_right),
        subtitle: Text('iphonex'),
        onTap: () {        },
      ),
       // เส้นคั่น
       Divider(),
       ListTile(
        // icon เป็น img เป็น  text ก็ได้
        title: Text('Quit', style: TextStyle(fontSize: 20.0),),
        trailing: Icon(Icons.exit_to_app),
        subtitle: Text('exit from app'),
        onTap: () {
          exit(0);
        },
      ),
 
        ],
      ),
    );


    return Scaffold(
      appBar: customBar,
      body: pages[_currentIndex],
      floatingActionButton: customfloatingAction,
      bottomNavigationBar: customBottom,
      drawer: drawer,
    );
  }
}