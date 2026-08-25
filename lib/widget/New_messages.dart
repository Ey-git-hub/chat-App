import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget{
  NewMessages({super.key});
  
  State<NewMessages> createState(){
    return _NewMessagesState();
  }
  }

class _NewMessagesState extends State<NewMessages>{
  var _messageController=TextEditingController();
@override
dispose(){
_messageController.dispose();
  super.dispose();
}

  void _submitMessage() async{
  final _enterdtext=_messageController.text;
  if (_enterdtext.trim().isEmpty){
    return;
  }
      FocusScope.of(context).unfocus();
    _messageController.clear();

//send to fire base
final user= await FirebaseAuth.instance.currentUser!;
final userData= await FirebaseFirestore.instance.collection('users').doc(user.uid).get();


FirebaseFirestore.instance.collection('chat').add({
  'text':_enterdtext,
  'createdAt':Timestamp.now(),
  'userid':user.uid,
  'username':userData.data()!['username'],
  'userImage':userData.data()!['userImage'],
});

  }
  @override
  Widget build(BuildContext context) {
   return Padding(padding: EdgeInsets.only(right:1,top:2,left:20,bottom: 40),
   child: Row(children: [
    Expanded(child: TextField(
      controller: _messageController,
      autocorrect: true,
      decoration: InputDecoration(labelText: 'Send Messages....'),
      enableSuggestions: true,
      textCapitalization: TextCapitalization.sentences,

    )),
    IconButton(icon:Icon(Icons.send),color: Theme.of(context).colorScheme.primary,onPressed: _submitMessage,)
   ],),);
  }
}