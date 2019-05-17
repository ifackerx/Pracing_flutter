import 'package:http/http.dart' as http; 
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';

class UserScreem extends StatefulWidget {
  @override
  _UserScreemState createState() => _UserScreemState();
}

class _UserScreemState extends State<UserScreem> {

  var users;
  bool isLoading = true;
  // http : 
  Future<Null> getUser() async {
    final response = 
      await http.get('https://randomuser.me/api/?page=3&results=10&seed=abc');

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);

      // เอาข้อมูลตรงนี้ด้วย
      setState(() {
        isLoading = false;
        users = jsonResponse['results'];
      });

    } else {
      print('Conection Error');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUser();
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
                    // ตัว gen automatic 
      body: ListView.builder(itemBuilder: (context, int index) {
        return Center(
          child: isLoading ? CircularProgressIndicator() : 
          ListTile(
            onTap: () {},
            leading: CircleAvatar(backgroundImage: NetworkImage(users[index]['picture']['medium']),),
            title: Text('${users[index]['name']['first']} ${users[index]['name']['last']}', style: TextStyle(fontSize: 20.0),),
            subtitle: Text('${users[index]['email']}'),
            trailing: Icon(Icons.keyboard_arrow_right),
            ),
        );
      }, itemCount: users != null ? users.length : 0,),
    );
  }
}