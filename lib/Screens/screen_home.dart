// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_todo/Constants/constants.dart';
import 'package:my_todo/Screens/screen_login.dart';
import 'package:my_todo/Widgets/home_widgets.dart';
import 'package:my_todo/db/Model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../db/functions/fuctions.dart';
import 'screen_new_todo.dart';

class HomeScreen extends StatelessWidget {
  final _day = DateFormat('EEEE').format(DateTime.now());
  User? user=FirebaseAuth.instance.currentUser;
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
 // final _iskeyBoard=MediaQuery.of(context).viewInsets.bottom>0;
    getToDo();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
            onPressed: () {

             // Bottomsheet(context, _iskeyBoard);
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>NewToDo()));
            },
            backgroundColor: black_main,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
      appBar: AppBar(
        title: Text(
          'Hi👋 ${user?.displayName}',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(onPressed: ()async{
            user_info = await SharedPreferences.getInstance();
            user_info?.clear();
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>LoginScreen()), (route) => false);
          }, icon: Icon(Icons.logout_outlined)),
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.account_circle,
              size: 35,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _day,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy').format(DateTime.now()),
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
             ValueListenableBuilder(
              valueListenable: todolist,
              builder: (context,List<ToDoList> todoList, child) {
                return ListView.builder(
                controller: ScrollController(keepScrollOffset:true),
                shrinkWrap: true,
                itemCount: todoList.length,
                itemBuilder: (ctx,index)=>
                todoList[index].finishdate==(DateFormat('dd-MM-yyyy').format(DateTime.now()))?ToDoCard(todo:todoList[index],index: index,):SizedBox(),
               );
              }
             ),
             Text('All',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
            ValueListenableBuilder(
              valueListenable: todolist,
              builder: (context, todoList, child) => ListView.builder(
                shrinkWrap: true,
                itemCount: todoList.length,
                controller: ScrollController(keepScrollOffset: true),
                itemBuilder: (ctx,index)=>ToDoCard(todo: todoList[index],index: index,)),
            )
            ],
          ),
        ),
      )),
    );
  }
}

Bottomsheet(context,iskeyBoard) {
  return (showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: (Container(
              height: 400,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New ToDo',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    cursorColor: black_main,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'ToDo',
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
                  ),
                ],
              ),
            )),
          ),
        );
      }));
}

// myBottomSheet(context) {
//   return (Scaffold.of(context).showBottomSheet(
//     (context) => Container(
//       height: 300,
//       width: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'New ToDo',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           TextFormField(
//             cursorColor: black_main,
//             keyboardType: TextInputType.emailAddress,
//             decoration: InputDecoration(
//                 labelText: 'ToDo',
//                 labelStyle: TextStyle(
//                     //fontWeight: FontWeight.bold,
//                     color: black_main),
//                 contentPadding: EdgeInsets.symmetric(
//                   vertical: 0,
//                   horizontal: 10,
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                   color: black_main,
//                   width: 1.5,
//                 )),
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(
//                   width: 2,
//                   color: Colors.yellow,
//                 ))),
//           ),
//         ],
//       ),
//     ),
//   ));
// }
