import 'package:flutter/material.dart';
import 'package:flutter_app/screens/add_member_screen.dart';
import 'package:flutter_app/screens/app_screen.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/screens/main_screen.dart';
import 'package:flutter_app/screens/member_screen.dart';
import 'package:flutter_app/screens/page_one.dart';
import 'package:flutter_app/screens/page_two.dart';
import 'package:flutter_app/screens/user_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
      home: LoginScreen(),
      routes: <String, WidgetBuilder>{
        '/app' : (BuildContext context) => AppScreen('Heloow'),
        '/one' : (BuildContext context) => PageOne(),
        '/two' : (BuildContext context) => PageTwo(),
        '/user' : (BuildContext context) => UserScreem(),
        '/login' : (BuildContext context) => LoginScreen(),
        '/member' : (BuildContext context) => MemberScreen(),
        '/add-member' : (BuildContext context) => AddMemberScreen(),
        
      },
      localizationsDelegates: [
   // ... app-specific localization delegate[s] here
   GlobalMaterialLocalizations.delegate,
   GlobalWidgetsLocalizations.delegate,
 ],
 supportedLocales: [
    const Locale('en'), // English
    const Locale('he'), // Hebrew
    const Locale('zh'), // Chinese
    // ... other locales the app supports
  ],
    // don't forget semicolon
    );
  }
}

// state full คืออัพเดทได้ไหม