// ignore_for_file: prefer_const_constructors, annotate_overrides, avoid_print

import 'package:chat_hive/firebase_options.dart';
import 'package:chat_hive/screens/Chat_Screen.dart';
import 'package:chat_hive/screens/Welcom_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({ super.key });

  @override
  State<MyApp> createState() => __MyAppState();
}



class __MyAppState extends State<MyApp> {
  void initState() {
   FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('=====================================================User is currently signed out!');
    } else {
      print('=====================================================User is signed in!');
    }
  });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
      theme: ThemeData(
       
      ),
      home:  (FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser!.emailVerified) ? ChatScreen() : Welcomscreen(),
    );
    
  }
}


