import 'package:chat_hive/screens/Chat_Screen.dart';
import 'package:chat_hive/screens/Welcom_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
  

  final email = FirebaseAuth.instance.currentUser!.email;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xff032f30),
      appBar: AppBar(
        leading: IconButton(onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ChatScreen(),));

        }, icon: Icon(Icons.arrow_back , color: Colors.white,)),
        backgroundColor:Color(0xff032f30) ,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: size.height * .1,
              child: Image(image: AssetImage("images/chat-bubble_17747387.png")),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Chat Hive",
              style: TextStyle(
                  color: Colors.white, fontFamily: "Titlefont", fontSize: 40),
            ),
          ],
        ),

        
        SizedBox(height: 40,),



     Padding(
       padding: const EdgeInsets.only(left: 10),
       child: Text("Yor Profile :  " , style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w900
       ),),
     ),


     Padding(
       padding: const EdgeInsets.only(left: 10),
      
       child: Row(children: [
        Text("Email : " , style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),),
        
         
        Text("$email" , style: TextStyle(
          color: Colors.white,
          fontSize: 20,
       
        ),)
       
       ],),
     ),


     SizedBox(height: size.height*.1,),





      Padding(
        padding: EdgeInsets.symmetric(horizontal: size.height*.025),
        child: Material(
        elevation: BorderSide.strokeAlignCenter,
        borderRadius: BorderRadius.circular(20),
        child: MaterialButton(
            height: 50,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            minWidth: size.width*.025,
            onPressed: ()async{
                await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Welcomscreen(),));
            },
            child: Text("Log Out " , style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              
            ),),
            color: Color(0xff031716),
            ),
        ),
            ),
      

        ],
      ),
    );
  }
}