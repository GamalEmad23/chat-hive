// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unused_local_variable, body_might_complete_normally_nullable, sort_child_properties_last, use_build_context_synchronously, avoid_print, curly_braces_in_flow_control_structures, avoid_single_cascade_in_expression_statements, file_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chat_hive/screens/LogIn_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


// final username = FirebaseAuth.instance.currentUser!.displayName;

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}


class _RegistrationScreenState extends State<RegistrationScreen> {
    GlobalKey<FormState> form = GlobalKey();

     TextEditingController  email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController username = TextEditingController();
    bool secret = false;
    bool loding = false;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;



    return Scaffold(
       body: ModalProgressHUD(
         inAsyncCall: loding,
         child: Form(
                 key: form,
         
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: size.height*.2,
                child: Image.asset('images/chat-bubble_17747387.png'),
              ),

              SizedBox(height: 10),
         
         
         
         
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                 controller: username,
                 validator: (value) {
                   if(value!.isEmpty){
                    return  "this field can't be empity";
                   }
                 },
                 decoration: InputDecoration(
         
                  floatingLabelStyle: TextStyle(color: Colors.white),
                  
                  fillColor: Color(0xff6BA3BE),
                  filled: true,
                  hintText: "Enetr your name ",
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
         
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                 ),
                ),
              ),
         
         
         
              SizedBox(height: size.height*.025,),
         
         
           
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                 controller: email,
                 validator: (value) {
                   if(value!.isEmpty){
                    return  "this field can't be empity";
                   }
                 },
                 decoration: InputDecoration(
         
                  floatingLabelStyle: TextStyle(color: Colors.white),
                  
                  fillColor: Color(0xff6BA3BE),
                  filled: true,
                  hintText: "Enetr your email ",
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
         
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                 ),
                ),
              ),
         
         
         
              SizedBox(height: size.height*.025,),
         
         
         
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                 obscureText: secret,
                 controller: password,
                 validator: (value) {
                   if(value!.isEmpty){
                    return "this field can't be embity ";
                   }
                 },
                 decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(color: Colors.white),
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      secret = !secret;
                    });
                  }, icon: secret == false ? Icon(Icons.remove_red_eye_outlined) :  Icon(Icons.remove_red_eye)),
                  fillColor: Color(0xff6BA3BE),
                  filled: true,
                  hintText: "Enetr your password ",
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
         
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                 ),
                ),
              ),
         
            
         
         
              SizedBox(height: size.height*.025,),
         
         
         
         
                      
                       Material(
               elevation: BorderSide.strokeAlignCenter,
               borderRadius: BorderRadius.circular(20),
               child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.height*.035),
          child: MaterialButton(
            height: 50,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            minWidth: size.width*.025,
            onPressed: () async {
             if(form.currentState!.validate())
 setState(() {
             loding = true;
   
 });
                             try {
                                final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: email.text,
                                  password: password.text,
                                );
                                FirebaseAuth.instance.currentUser!.sendEmailVerification();
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => LoginScreen(), ));
                                setState(() {
                                  loding = false;
                                });
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.info,
                                    animType: AnimType.rightSlide,
                                    title: 'weak-password',
                                    desc: 'The password provided is too weak.',
                                   
                                    )..show();
                              
                              
                                } else if (e.code == 'email-already-in-use') {
                                  print('The account already exists for that email.');
                                   AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.info,
                                    animType: AnimType.rightSlide,
                                    title: 'email-already-in-use',
                                    desc: 'The account already exists for that email.',
                                   
                                    )..show();
                                }
                              } catch (e) {
                                print(e);
                              }
                           
            },
            child: Text("Register " , style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              
            ),),
            color: Color(0xff032f30),
            ),
               ),
             ),
         
            ],
           ),
         ),
       ),
    );
  }
}