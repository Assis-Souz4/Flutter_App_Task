//classe que tem a responsabilidade de comunicação com o banco de dados
import 'package:flutter_app_task_2024/components/my_task.dart';

class TaskDao {
  //criação da tabela do db
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT,'
      '$_difficulty INTEGER,'
      '$_image TEXT)';

//itens da tabela
  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  //
  //salvar dado
  save(MyTask task) async {}
  //procurar todos os dados
  Future<List<MyTask>> findAll() async {}
  //procurar um dado
  Future<List<MyTask>> find(String nameTask) async {}
  delete(String nameTask) async {}
}
