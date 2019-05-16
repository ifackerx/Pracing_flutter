import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  String firstName = 'Thong-ngurn';
  String lastName = 'Yapradit';

  String address = '''
  line 1
  line 2
  line 3
  ''';

  int age = 20;
  // ues dot too!
  double weight = 50.0;
  double height = 170.0;

  bool isActive = true;
  bool isCancle = false;
  
  // เป็นตัวแปรอะไรก้็ได้
  var description = 'ss';

  // Map => object
  Map types = {'type' : 'admin', 'code' : 'ADM'};
  
  // กำหนด value (Key, Value) 
  Map<String, int> type2 = {'age' : 21};

  List sex = ['male', 'female'];
  // define a types
  List<int> ages = [10,20,30];
  // define type in tyepe
  List<Map<String, int>> myUser = [{'ages' : 20}];

  // void ไม่คืนค่า
  void showName(String name, int age) {
    print('Name : $name, Age: $age');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appbar ข้างบนของตัว app
        appBar: AppBar(
          title: Text('Traing StateFull <3'),
        ),
          body: Center(
            child: RaisedButton(
              onPressed: () {
                // $ it's mean join String
                print('$firstName $lastName');
                print('=======');            
                double bmi = weight / ((height / 100) * (height / 100));
                print(bmi);

                this.showName('Flutter', 30);  

                Person person = Person('Hello Flutter');
                person.showname();   
              }, 
              child: Text('Click Me!'),
              color: Colors.pink[100],
              textColor: Colors.white70,
              ),
            ),
      );
  }
}


class Person {
  String name;
  
  // constructor; ใช้ this ด้วยข้า มันเป้นเหมือน get/set อ้ะ!
  Person(this.name);
  showname() {
    print('Class, name: $name');
  }
}