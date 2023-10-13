import 'package:get/get.dart';
import 'package:todo/helpers/localData_Helper.dart';
import 'package:todo/models/task.dart';
class TaskController extends GetxController{

  final taskList =<Task> [].obs;
  addTask({ required Task task}){
  DBH.add(task);
  }

  Future <void> getTasks()async{
    final List<Map<String, dynamic>> tasks  = await DBH.getAll();
    taskList.assignAll(tasks.map((data)=>Task.fromjson(data)).toList());
  }

  void deleteTask (task)async{
    await DBH.delete(task);
    getTasks();
  }

  void deleteALLTasks(task)async {
    await DBH.deleteAll();
    getTasks();
  }

  updateTask(id)async{
    await DBH.update(id);
    getTasks();
  }

}