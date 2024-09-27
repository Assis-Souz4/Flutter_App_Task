import 'package:flutter_app_task_2024/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//abrindo o banco de dados 
//achar o caminho e abri e criar o banco caso nâo exista
Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'task.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(TaskDao.tableSql);
    db.execute(path);
  }, version: 1);
}
