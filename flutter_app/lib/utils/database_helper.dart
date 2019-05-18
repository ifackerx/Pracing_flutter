import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:synchronized/synchronized.dart';

class DatabaseHelper {
  static Database _db;

  // contructor ของ class
  DatabaseHelper.internal();


  final _lock = new Lock();

  final String table = 'members';

  String sqlCreate = '''
  create table if not exists members(
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    first_name TEXT, 
    last_name TEXT, 
    email TEXT, 
    telephone TEXT, 
    birth_date TEXT, 
    image TEXT)
  ''';

  Future<Database> getDb() async {
    if (_db == null) {
      io.Directory documentDirectory = await getApplicationDocumentsDirectory();

      String path = join(documentDirectory.path, 'members.db');

      await _lock.synchronized(() async {
        if (_db == null) {
          _db = await openDatabase(path, version: 1);
        }
      });
    }

    return _db;
  }

  Future initDatabase() async {
    var dbClient = await getDb();
    // Create table
    await dbClient.rawQuery(sqlCreate);
    print('Table is created');
  }

  Future savaData(Map member) async {
    var dbClient = await getDb();
    // Create table
    String sql = '''
    INSERT INTO members(first_name, last_name, email, telephone, birth_date)
    VALUES(?, ?, ?, ?, ?)
    ''';
    await dbClient.rawQuery(sql, [
        member['firstname'],
        member['lastname'],
        member['email' ],
        member['telephone'],
        member['birthDate']
      ]);
    print('Table is created');
  }

  Future getList() async {
    var dbClient = await getDb();
    // Create table
    var sql = '''
    SELECT * FROM members
    ''';

    // ถ้าเป็น get ก้ต้อง return ออกไป !s
    return await dbClient.rawQuery(sql);

    print('Table is show');
  }

  Future revove(int id) async {
    var dbClient = await getDb();
    // Create table
    var sql = '''
    DELETE * FROM members
    WHERE id=?
    ''';

    // ถ้าเป็น get ก้ต้อง return ออกไป !s
    return await dbClient.rawQuery(sql, [id]);

    print('Table is DELETE');
  }


}

