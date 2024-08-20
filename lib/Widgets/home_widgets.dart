// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_todo/Constants/constants.dart';
import 'package:my_todo/db/Model/model.dart';
import 'package:my_todo/db/functions/fuctions.dart';

class ToDoCard extends StatefulWidget {
  final ToDoList todo;
  final index;
  const ToDoCard({super.key,required this.todo, required this.index});

  @override
  State<ToDoCard> createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) async{
        removeFromList(widget.index);
      },
      background: Container(
        child:const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.delete_sweep_outlined,color:  Color.fromARGB(255, 249, 105, 105),size: 35,)
          ],
        ),
      ),
      key:ValueKey(widget.index),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: (){
      
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(
                          () {
                            isChecked = value!;
                          },
                        );
                      },
                      checkColor: Colors.white,
                      activeColor: black_main,
                      side: BorderSide(
                        color: Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)
                    ),
                    ),
                    Flexible(
                      child: Text(widget.todo.Todo,
                        softWrap: true,
                        style: TextStyle(
                          color: !isChecked? black_main:Colors.grey,
                          decoration: isChecked? TextDecoration.lineThrough:null
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Finish Date:${widget.todo.finishdate}',
                    style: TextStyle(
                      fontSize: 10
                    ),),
                    Text(DateFormat('dd-MM-yyyy').format(widget.todo.createDate),
                    style: TextStyle(
                      fontSize: 10
                    ),),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

