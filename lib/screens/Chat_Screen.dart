// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_field, unused_element, unused_local_variable, await_only_futures, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace, avoid_print, unused_import, unnecessary_string_interpolations, camel_case_types

import 'package:chat_hive/screens/Profile_Screen.dart';
import 'package:chat_hive/screens/Welcom_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final _firestor = FirebaseFirestore.instance;
final time = FieldValue.serverTimestamp();


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextControler = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final sender = FirebaseAuth.instance.currentUser!.email;
  String? messageText;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // void getMessages ()async{
    //  final messages = await _firestor.collection('messages').get();

    //   for(var message in messages.docs )
    //   {
    //     print(message.data());
    //   }
    //  }

      // IconButton(
      //       onPressed: () async {
      //         // messageStream();
      //         await FirebaseAuth.instance.signOut();
      //         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Welcomscreen(),));
      //       },
      //       icon: Icon(Icons.close),
      //       color: Colors.white,
      //     )

    void messageStream() async {
      await for (var snapshot in _firestor.collection('messages').snapshots()) {
        for (var message in snapshot.docs) {
          print(message.data());
        }
      }
    }

    return Scaffold(
    
      appBar: AppBar(
        

        backgroundColor: Color(0xff032f30),
        actions: [],
        title: Row(
          children: [
            Container(
              height: size.height * .05,
              child: Image(image: AssetImage("images/chat-bubble_17747387.png")),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Chat Hive",
              style: TextStyle(
                  color: Colors.white, fontFamily: "Titlefont", fontSize: 30),
            ),
          ],
        ),
       

        
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(color: Color(0xff032f30),height: 70, child: 
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
           
            

                 Container(
                height: 50,
                child: InkWell(
                  onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
                  },
                  child: Image(image: AssetImage("images/profile.png")))),

                SizedBox(height: 20,),

                  Text('$sender' , style: TextStyle(
                color: Colors.white,
                fontSize: 19
              ),),
            ],
          ),
            ),




            messageStreamBuilder(),





            Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLines: 100,
                      minLines: 1,
                      
                      controller: messageTextControler,
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: InputDecoration(
                          hintText: "write your message here... ",
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Color(0xff031716),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  )),
                  MaterialButton(
                    onPressed: () async {

                      messageTextControler.clear();
                      _firestor.collection('messages').add({
                        'text': messageText,
                        'sender': FirebaseAuth.instance.currentUser?.email,
                        'time' : FieldValue.serverTimestamp(),
                      });
                    },
                    child: Image(
                      image: AssetImage("images/send.png"),
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class messageStreamBuilder extends StatelessWidget {
  const messageStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestor.collection('messages').orderBy('time').snapshots(),
      builder: (context, snapshot) {
        List<MessageStyle> messageWidgets = [];

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ),
          );
        }

        final messages = snapshot.data!.docs.reversed;
        for (var message in messages) {
          final messageText = message.get('text');
          final messageSender = message.get('sender');
          final currentUser = FirebaseAuth.instance.currentUser!.email;
         


          final messageWidget = MessageStyle(
            sender: messageSender,
            text: messageText, isMe: currentUser == messageSender ,
          );

          messageWidgets.add(messageWidget);
        }

        return Expanded(
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                children: messageWidgets));
      },
    );
  }
}


class MessageStyle extends StatelessWidget {
  const MessageStyle({super.key, required this.sender, required this.text, required this.isMe});

  final String? sender;
  final String? text;
  final bool  isMe;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment:isMe ?  CrossAxisAlignment.end :  CrossAxisAlignment.start,
        children: [
          Text(
            "$sender",
            style: TextStyle(color: Colors.yellow[900], fontSize: 12),
          ),
             isMe ? Material(
              elevation: 10,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color:isMe ? Colors.blue  : Colors.orange[300],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text("$text"),
              )) :  Material(
              elevation: 10,

              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color:isMe ? Colors.blue  : Colors.orange[300],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text("$text"),
              )),
        ],
      ),
    );
  }
}
