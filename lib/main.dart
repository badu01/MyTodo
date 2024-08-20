import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_todo/Constants/constants.dart';
import 'package:my_todo/Functions/login_functions.dart';
import 'package:my_todo/Screens/screen_splash.dart';
import 'package:my_todo/db/Model/model.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ToDoListAdapter().typeId)) {
    Hive.registerAdapter(ToDoListAdapter());
  }
  await initFireBase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: black_main,
        splashColor: Colors.grey[200],
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.grey
        ),
        
        textTheme: GoogleFonts.anonymousProTextTheme(),
      ),
      home:const SplashScreen(),
      builder: EasyLoading.init()
    );
  }
}


