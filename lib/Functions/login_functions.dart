// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_todo/Constants/constants.dart';
import 'package:my_todo/Screens/screen_home.dart';
import 'package:my_todo/Screens/screen_login.dart';
import 'package:my_todo/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

initFireBase() async {
// ...

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future userRegEmail(emailAddress, password) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    return credential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print(e);
    return false;
  }
}

signIn(email, pass, context) async {
  try {
    user_info=await SharedPreferences.getInstance();
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass);
        credential.user!.updateDisplayName("baduss");
    print('---------------->${credential.user?.providerData[0].email}');
    if(credential.user!=null){
    user_info?.setString('email', email);
    user_info?.setString('pass', pass);
    EasyLoading.dismiss();
    Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (ctx) => HomeScreen()), (route) => false);
    return true;
    }
    return false;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      return('Wrong password provided for that user.');
    }
  }
}

setUserInfo({disName, name, phone, required UserCredential c_user,context}) async {
 // print('${disName.text},${name.text},${phone.text}');
  print('userrrrrr------------>$c_user');
    var myUser =FirebaseAuth.instance.currentUser;
  try {
    await myUser?.updateDisplayName(disName.text);
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>LoginScreen()));
  } catch (e) {
    print(e);
  }
  print(myUser?.displayName);
  print(myUser?.phoneNumber);
}
