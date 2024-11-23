
// ignore_for_file: sort_child_properties_last, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
   MyButton({ required this.title, required this.color, required this.onpress});

   final String title ;
   final Color color ; 
   final Function onpress;
     
 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      elevation: BorderSide.strokeAlignCenter,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.height*.025),
        child: MaterialButton(
          height: 50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minWidth: size.width*.025,
          onPressed: ()=> onpress,
          child: Text(title , style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            
          ),),
          color: color,
          ),
      ),
    );
  }
}