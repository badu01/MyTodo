
import 'package:hive/hive.dart';
part 'model.g.dart';


@HiveType(typeId: 0)
class ToDoList {
  @HiveField(0)
  String Todo="";
  @HiveField(1)
  DateTime createDate= DateTime.now();
  @HiveField(2)
  String finishdate="";

  ToDoList({required this.Todo, required this.createDate ,required this.finishdate});
  
}