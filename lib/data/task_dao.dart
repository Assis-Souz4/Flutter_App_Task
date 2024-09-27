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
  save(MyTask task) async {
    print('INIT SAVE');
    final Database bancoDeDados = await getDatabase();
    //comparando para verificar se a tarefa existe no banco
    var itemExist = await find(task.taskName);
    Map<String, dynamic> mapaDeTarefas = toMap(task);
    if (itemExist.isEmpty) {
      print('Task not found');
      return await bancoDeDados.insert(_tablename, mapaDeTarefas);
    } else {
      print('Task found');
      return await bancoDeDados.update(
        _tablename,
        mapaDeTarefas,
        where: '$_name = ?',
        whereArgs: [task.taskName],
      );
    }
  }

  Map<String, dynamic> toMap(MyTask tarefa) {
    print('Covering task for Map');
    final Map<String, dynamic> mapTask = Map();
    mapTask[_name] = tarefa.taskName;
    mapTask[_difficulty] = tarefa.valueTaskNivel;
    mapTask[_image] = tarefa.imageTask;
    print('Map task is $mapTask');
    return mapTask;
  }

  //procurar todos os dados
  Future<List<MyTask>> findAll() async {
    print('ACCESS FINDALL');
    final Database bancoDeDados = await getDatabase();
    //add o resultado da query na variavel result
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('QUERY: $result');
    return toList(result);
  }

  //função transforma a map em list
  List<MyTask> toList(List<Map<String, dynamic>> mapOfTask) {
    final List<MyTask> tarefas = [];
    for (Map<String, dynamic> linha in mapOfTask) {
      final MyTask tarefa =
          MyTask(linha[_name], linha[_difficulty], linha[_image]);
      tarefas.add(tarefa);
    }
    print('TASK LIST: ${tarefas}');
    return tarefas;
  }

  //procurar um dado
  Future<List<MyTask>> find(String nameTask) async {
    print('ACCESS FIND');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nameTask],
    );
    print('TASK: ${toList(result)}');
    return toList(result);
  }

  delete(String nameTask) async {
    print('DELETE TASK $nameTask');

    final Database bancoDeDados = await getDatabase();
    return bancoDeDados.delete(
      _tablename,where: '$_name = ?',
      whereArgs: [nameTask],
    );
  }
}
