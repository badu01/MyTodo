// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_todo/Constants/constants.dart';
import 'package:my_todo/Functions/login_functions.dart';
import 'package:my_todo/Screens/screen_register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure =true;
  final TextEditingController _email= TextEditingController();
  final TextEditingController _pass= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new))),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Login',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: black_main),
              ),
              SizedBox(
                height: 80,
              ),
              TextFormField(
                cursorColor: black_main,
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'Email',
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
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: _pass,
                obscureText: isObscure,
                obscuringCharacter: '*',
                cursorColor: black_main,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      isObscure= !isObscure;
                    });
                  }, icon: Icon(Icons.remove_red_eye_outlined)),
                    labelText: 'Password',
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
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () async{
                  EasyLoading.instance
                    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
                    ..backgroundColor = Colors.transparent
                    ..indicatorColor = Colors.yellow
                    ..maskColor = const Color.fromARGB(255, 24, 81, 128).withOpacity(0.5)
                    ..dismissOnTap= true;
                  
                  EasyLoading.show();
                  await signIn(_email.text, _pass.text,context);

                },
                minWidth: double.infinity,
                color: black_main,
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Divider(
                        color: Color.fromARGB(255, 116, 116, 116),
                        thickness: 1,
                      ),
                    ),
                    Text(' or '),
                    Expanded(
                      flex: 2,
                      child: Divider(
                        color: Color.fromARGB(255, 116, 116, 116),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://icons.iconarchive.com/icons/fa-team/fontawesome-brands/256/FontAwesome-Brands-Google-icon.png',
                      height: 18,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Login with Google',
                      style: TextStyle(color: black_main),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                  enableFeedback: true,
                  splashFactory: InkSparkle.splashFactory,
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.apple,
                      color: black_main,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Login with Apple',
                      style: TextStyle(color: black_main),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>RegisterScreen()));
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: black_main, fontWeight: FontWeight.w600),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
