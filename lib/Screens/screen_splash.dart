import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_todo/Constants/constants.dart';
import 'package:my_todo/Functions/login_functions.dart';
import 'package:my_todo/Screens/screen_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoggedin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'Assets/images/TODO_LOGO.png',
              height: 150,
            ),
            SizedBox(
              height: 250,
            ),
            const Text("LOADING"),
            SizedBox(
              height: 10,
            ),
            LoadingAnimationWidget.inkDrop(color: black_main, size: 30),
          ],
        ),
      )),
    );
  }

  isLoggedin(context) async {
    user_info = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 3));
    if (user_info?.getString('email') == null &&
        user_info?.getString('pass') == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => const LoginScreen()),
          (route) => false);
    } else {
      signIn(
          user_info?.getString('email'), user_info?.getString('pass'), context);
    }
  }

  // isUser(email, pass)async{
  //   print(email);
  //   print(pass);
  //   if(email=='null' && pass=='null'){
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }
}
