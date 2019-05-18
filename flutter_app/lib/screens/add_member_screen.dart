import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/database_helper.dart';


class AddMemberScreen extends StatefulWidget {
  @override
  _AddMemberScreenState createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  
  // ดึง Database มาใช้ จาก flie database helper
  DatabaseHelper databaseHelper = DatabaseHelper.internal();

  final _formKey = GlobalKey<FormState>();
  // ส่วนของตัวแปร 
  DateTime birthDate;
  // เอาไว้โช
  String strBirthDate;
  // text editing ไว้ใช้กับ input form
  TextEditingController ctrlFirstname = TextEditingController();
  TextEditingController ctrtlLastname = TextEditingController();
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlTelephone = TextEditingController();
  
  String sex = 'Male';
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
  
  DateTime _currentDate;
  int _year = DateTime.now().year;
  int _month = DateTime.now().month;
  int _day = DateTime.now().day;

  Future<Null> _showDatePicker() async {
    final DateTime picked = await showDatePicker(
      locale: const Locale('th'),
      context: context,
      initialDate: DateTime(_year,_month,_day),
      firstDate: new DateTime(1920,1,1),
      lastDate: new DateTime(_year, _month,_day));
    if (picked != null && picked != _currentDate) {
      setState(() {
        var strDate = new DateFormat.MMMMd('th_th')
          .format(new DateTime(picked.year, picked.month, picked.day));
        strBirthDate = '$strDate ${picked.year + 543}';
        birthDate = picked;
      });
    }
  }
  
  Future<Null> saveData() async {
    print(ctrlFirstname.text);
    print(ctrtlLastname.text);
    print(sex);
    print(birthDate);
    print(ctrlEmail.text);
    print(ctrlTelephone.text);
    print(isActive);

    if (_formKey.currentState.validate() && birthDate != null) {
      Map member = {
        'firstname' : ctrlFirstname.text,
        'lastname'  : ctrtlLastname.text,
        'email'     : ctrlEmail.text,
        'telephone' : ctrlTelephone.text,
        'birthDate' : birthDate.toString(),
      };
      await databaseHelper.savaData(member);
      print('saVe;!!');
    }else{
      print('Faied');
    }

  }


    return Scaffold(
      appBar: AppBar(
        title: Text('Add new member'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save_alt), 
            onPressed: () {
              if (_formKey.currentState.validate()) {
                saveData();
                print('OK');
              }else{
                print('Failed');
              }
            }
            )
        ],
        
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Member Form', style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.person),
                            SizedBox(width: 15.0),
                            Expanded(
                                child: TextFormField(
                                  validator: (String value) {
                                    if (value.isEmpty) return 'Please enter your name';
                                  },
                                  controller: ctrlFirstname,
                                  decoration: InputDecoration(
                                  fillColor: Colors.pink[100],
                                  labelText: 'First Name',
                                ),
                              ),
                            ),
                            
                            SizedBox(width: 15.0),
                            
                            Expanded(
                                child: TextFormField(
                                  validator: (String value) {
                                    if (value.isEmpty) return 'Please enter your lastname';
                                  },
                                controller: ctrtlLastname,
                                decoration: InputDecoration(
                                  fillColor: Colors.pink[100],
                                  labelText: 'Last Name',
                                ),
                              ),
                            ),
                          ],
                        ),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 50.0,),
                          Text('Birth Date',style: TextStyle(fontSize: 15.0)),
                          FlatButton(
                            onPressed: () => _showDatePicker(),
                            child: Text(strBirthDate ?? 'Chose your date', style: TextStyle(fontSize: 15.0, color: Colors.pink)),
                          )
                        ],
                      ),


                        TextFormField(
                          validator: (String value) {
                                    if (value.isEmpty) return 'Please enter your email';
                                  },
                          keyboardType: TextInputType.emailAddress,
                          controller: ctrlEmail,
                          decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            labelText: 'E-mail'
                          ),
                        ),
                        TextFormField(
                          validator: (String value) {
                                    if (value.isEmpty) return 'Please enter your number';
                                  },
                          controller: ctrlTelephone,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            icon: Icon(Icons.phone),
                            labelText: 'Telephone'
                          ),
                        ),
                        SwitchListTile(
                          value: true, 
                          activeColor: Colors.pink[100],
                          onChanged: (bool value) {
                            setState(() {
                              isActive = value;
                            });
                          }, 
                          title: Text('เปิดการใช้งานระบบ'),
                        ),

                        ListTile(
                          
                          title: const Text('Sex'),
                          trailing: new DropdownButton<String>(
                            
                            value: sex,
                            onChanged: (String newValue) {
                              setState(() {
                                sex = newValue;
                              });
                            },
                            items: <String>['Male','Female'].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: Container(child: new Text(value), width: 120.0,),
                              );
                            }).toList(),

                          ),
                        ),


                        
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}