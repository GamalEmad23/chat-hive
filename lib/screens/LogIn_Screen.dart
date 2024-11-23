// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, body_might_complete_normally_nullable, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_print, file_names, use_build_context_synchronously

import 'package:chat_hive/screens/Chat_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    TextEditingController  email = TextEditingController();
    TextEditingController password = TextEditingController();
    GlobalKey<FormState> form = GlobalKey();
    bool loding = false;

    
 
   
   

    bool secret = false;
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
            onPressed: ()async{
              if(form.currentState!.validate()){
                 
                 setState(() {
                   loding=true;
                 });

                try {
           final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
             email: email.text,
             password: password.text,
           );
         
           if(FirebaseAuth.instance.currentUser!.emailVerified){
             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ChatScreen(),));
               setState(() {
                   loding=false;
                 });
                 
           }
         } on FirebaseAuthException catch (e) {
           if (e.code == 'user-not-found') {
             print('No user found for that email.');
           } else if (e.code == 'wrong-password') {
             print('Wrong password provided for that user.');
           }
         }
              }
            },
            child: Text("Log In " , style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              
            ),),
            color: Color(0xff032f30),
            ),
               ),
             ),
                
         
                SizedBox(height: size.height*.025,),
         
         
         
         
             
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Container(
              //           color: Colors.black,
              //           height: size.height * .001,
              //           width: size.width * .26,
              //         ),
              //         Text("Or login with "),
              //         Container(
              //           color: Colors.black,
              //           height: size.height * .001,
              //           width: size.width * .26,
              //         ),
              //       ],
              //     ),
         
              //   SizedBox(height: size.height*.025,),
         
         
              //   Container(
              //     height: size.height*.09,
              //     child: Center(
              //       child: ClipRRect(
              //       child: MaterialButton(onPressed: ()async{
              //  await signInWithGoogle();
              //       } , child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Image(image: AssetImage('images/google - Copy.png'),),
              //           Text("Gooogle sign in" , style: TextStyle(
              //             fontSize: 20
              //           ),),
              //         ],
              //       ),
              //                     ),),
              //     ),)
         
         
         
         
         
                  
                 
         
            ],
           ),
         ),
       ),
    );
  }
}