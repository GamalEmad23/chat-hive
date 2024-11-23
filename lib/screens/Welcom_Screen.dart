// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, sort_child_properties_last

import 'package:chat_hive/screens/LogIn_Screen.dart';
import 'package:chat_hive/screens/Registration_Screen.dart';
import 'package:flutter/material.dart';

class Welcomscreen extends StatefulWidget {
  const Welcomscreen({super.key});

  @override
  State<Welcomscreen> createState() => _WelcomscreenState();
}

class _WelcomscreenState extends State<Welcomscreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
          
            children: [
              Container(
                height: size.height*.3,
                child: Image(image: AssetImage('images/chat-bubble_17747387.png'))),

                Text("ChatHive" , style: TextStyle(
                  color: Colors.indigo[900],
                  fontSize: size.width*.1,
                  fontWeight: FontWeight.bold,
                  fontFamily: "logofont",
                ),),
            ],
          ),

          SizedBox(height: size.height*.035,),


        
                     Material(
      elevation: BorderSide.strokeAlignCenter,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.height*.025),
        child: MaterialButton(
          height: 50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minWidth: size.width*.025,
          onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen(),));
          },
          child: Text("Log In " , style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            
          ),),
          color: Color(0xff032f30),
          ),
      ),
    ),





          SizedBox(height: size.height*.020,),



           Material(
      elevation: BorderSide.strokeAlignCenter,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.height*.025),
        child: MaterialButton(
          height: 50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minWidth: size.width*.025,
          onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RegistrationScreen(),));
          },
          child: Text("Register " , style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            
          ),),
          color: Color(0xff0c969c),
          ),
      ),
    ),

        ],
      ),
    );
  }
}
