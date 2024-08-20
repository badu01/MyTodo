// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_todo/Constants/constants.dart';
import 'package:my_todo/db/Model/model.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../db/functions/fuctions.dart';

class NewToDo extends StatefulWidget {
  const NewToDo({super.key});

  @override
  State<NewToDo> createState() => _NewToDoState();
}

class _NewToDoState extends State<NewToDo> {

  DateRangePickerController date = DateRangePickerController();
  TextEditingController titleController = TextEditingController();
  var finish_date;
  @override
  Widget build(BuildContext context) {
    bool isKeyBorad = MediaQuery.of(context).viewInsets.bottom>0;
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height:!isKeyBorad? 50:0,
              ),
              !isKeyBorad? Text('New TODO',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: black_main),
              ):Text(''),
              SizedBox(height: 20),
              TextFormField(
                controller: titleController,
                cursorColor: black_main,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'TODO',
                    labelStyle: TextStyle(
                        //fontWeight: FontWeight.bold,
                        color: black_main),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 10,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: black_main,
                      width: 1.5,
                    )),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 2,
                      color: Colors.yellow,
                    ))),
              ),SizedBox(
                height: 20,
              ),
              Text("Finish Date",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              SfDateRangePicker(
                controller: date,
                backgroundColor: Colors.transparent,
                todayHighlightColor: black_main,
                showNavigationArrow: true,
                selectionColor: black_main,
                onSelectionChanged: (datetime){
                    print(datetime.value);
                    print(DateTime.now());
                    finish_date=DateFormat('dd-MM-yyyy').format(datetime.value);
                },
              ),
              ElevatedButton(onPressed: (){
                final todo= ToDoList(Todo: titleController.text,finishdate: finish_date,createDate: DateTime.now());
                addToList(todo);
                Navigator.pop(context); 
              }, child: Text("add"))
            ],
          ),
        ),
      )),
    );
  }
}