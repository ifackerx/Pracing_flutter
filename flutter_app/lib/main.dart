import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/main_screen.dart';

// state less ไม่มีอัพเดทค่าข้อมูลในตัวมันเอง แสดงอยาสงเดียว

// function แรกที่จะ run
void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'PrintAble4U',
      ),
      //  title ของตัว app 
      title: 'My Traing App',
      // widget ตัวแรกที่จะใช้แสดง 
      // Scafford รูปแบบของ Page (titlebar, button, appbar)
      home: HomeScreen()
      
    // don't forget semicolon
    );
  }
}

// state full คืออัพเดทได้ไหม