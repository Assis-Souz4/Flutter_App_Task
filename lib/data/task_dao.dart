//classe que tem a responsabilidade de comunicação com o banco de dados
import 'package:flutter_app_task_2024/components/my_task.dart';
import 'package:flutter_app_task_2024/data/database.dart';
import 'package:sqflite/sqflite.dart';

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
  Future<List<MyTask>> findAll() async {
    print('ACCESS FINDALL');
    final Database bancoDeDados = await getDatabase();
    //add o resultado da query na variavel result
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('QUERY $result');
    return toList(result);
  }

  List<MyTask> toList(List<Map<String, dynamic>> mapOfTask) {
    final List<MyTask> tarefas = [];
    for (Map<String, dynamic> row in mapOfTask) {
      final MyTask tarefa = MyTask(row[_name], row[_difficulty], row[_image]);
      tarefas.add(tarefa);
    }
    print('TASK LIST: ${tarefas}');
    return tarefas;
  }

  //procurar um dado
  Future<List<MyTask>> find(String nameTask) async {}
  delete(String nameTask) async {}
}
