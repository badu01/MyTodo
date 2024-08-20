

// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_todo/db/Model/model.dart';

ValueNotifier<List<ToDoList>> todolist=ValueNotifier([]);

void addToList(ToDoList item) async{

  final todo_db = await Hive.openBox<ToDoList>('todo_db');
  await todo_db.add(item);
  todolist.value.add(item);
  todolist.notifyListeners();
}


getToDo()async{
  final todo_db = await Hive.openBox<ToDoList>('todo_db');
  todolist.value.clear();
  todolist.value.addAll(todo_db.values);
  todolist.notifyListeners();
}

removeFromList(index) async{
      final todo_db = await Hive.openBox<ToDoList>('todo_db');
      print(index);
      todo_db.deleteAt(index);
      getToDo();
}
