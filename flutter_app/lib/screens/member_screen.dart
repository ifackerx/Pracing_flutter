import 'package:flutter/material.dart';
import '../utils/database_helper.dart';

class MemberScreen extends StatefulWidget {
  @override
  _MemberScreenState createState() => _MemberScreenState();
}



class _MemberScreenState extends State<MemberScreen> {
  
  DatabaseHelper databaseHelper = DatabaseHelper.internal();

  // ตัวแปรที่จะมาวันลูป ข้อมูล
  List members = [];



  Future getMember() async {
    var res = await databaseHelper.getList();
    print(res);


    // ไม่สามารถตั้งได้เลย เวลาจะตั้งต้องใช้ SETSTATE:!
    setState(() {
      members = res;
    });

  }
    Future removeMember(int id) async {
    await databaseHelper.revove(id);
  
  }
  @override
  void initState() {
    super.initState();
    getMember();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member'),
      ),
      // Listview builder ไว้วนลูปนะจ้ะ
      body: ListView.builder(
        itemBuilder: (context, int index) {
          return ListTile(
            title: Text(
              '${members[index]['first_name']} ${members[index]['last_name']}'
              ),
            subtitle: Text('${members[index]['email']}'),
            trailing: IconButton(
              icon: Icon(Icons.delete), 
              onPressed: () {}),
          );
        },
         itemCount: members != null ? members.length : 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/add-member'),
        child: Icon(Icons.person_add),
      ),
    );
  }
}