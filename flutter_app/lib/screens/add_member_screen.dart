import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class AddMemberScreen extends StatefulWidget {
  @override
  _AddMemberScreenState createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
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
        var formatter = new DateFormat('yyyy-MM-dd');
        String formatted = formatter.format(picked);
      });
    }
  }
  
  
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new member'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save_alt), onPressed: () {},)
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
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.person),
                            SizedBox(width: 15.0),
                            Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                  fillColor: Colors.pink[100],
                                  labelText: 'First Name',
                                ),
                              ),
                            ),
                            
                            SizedBox(width: 15.0),
                            
                            Expanded(
                                child: TextFormField(
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
                            child: Text('dd/mm/yyyy', style: TextStyle(fontSize: 15.0),),
                          )
                        ],
                      ),


                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            labelText: 'E-mail'
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            icon: Icon(Icons.phone),
                            labelText: 'Telephone'
                          ),
                        ),
                        SwitchListTile(
                          value: true, 
                          activeColor: Colors.pink[100],
                          onChanged: (bool value) {}, 
                          title: Text('เปิดการใช้งานระบบ'),
                        ),

                        ListTile(
                          title: const Text('Sex'),
                          trailing: new DropdownButton<String>(
                            value: 'Male',
                            onChanged: (String newValue) {},
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