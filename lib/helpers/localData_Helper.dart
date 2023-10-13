import 'package:sqflite/sqflite.dart';
import 'package:todo/models/task.dart';

class DBH{
  static Database? _database;
  static const int _version = 1;
  static const String _tableName= "tasks";

  static Future<void> initDB()async{
    if (_database != null){
      print("it's not empty");
    }
    else{
      try{
        String path ="${await getDatabasesPath()}task.db";
        _database= await openDatabase(
          path,
          version: _version,
          onCreate: (Database database,int version)async{
            await database.execute(
              'CREATE TABLE $_tableName '
              '(id INTEGER PRIMARY KEY AUTOINCREMENT, '
              'name STRING, note STRING, date STRING, '
              'startTime STRING, endTime STRING, '
              'remind INTEGER, repeat STRING, '
              'color INTEGER, '
              'isCompleted INTEGER)'
            );
          }
        );
      }catch(e){
        print(e);
      }
    }
  }
  static Future <int> add(Task? task) async {
    return await _database!.insert(
      _tableName,
      task!.tojson(),
    );
  }

  static Future<int> delete (Task? task)async{
    return await _database!.delete(_tableName,where: 'id=?', whereArgs: [task!.id]);
  }

  static Future<int> deleteAll()async{
    return await _database!.delete(_tableName);
  }

  static Future<List<Map<String, Object?>>> getAll (Task? task)async{
    return await _database!.query(_tableName);
  }

  static Future<int> update(int? id)async{
    return await _database!.rawUpdate(
      '''
      UPDATE tasks
      SET isCompleted = ?
      WHERE id = ?
      ''',
      [1,id]
    );
  }
}
