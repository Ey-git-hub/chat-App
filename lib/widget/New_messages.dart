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

  void _submitMessage(){
  final _enterdtext=_messageController.text;
  if (_enterdtext.trim().isEmpty){
    return;
  }
//send to fire base
    _messageController.clear();

  }
  @override
  Widget build(BuildContext context) {
   return Padding(padding: EdgeInsets.only(right:1,top:2,left:20,bottom: 50),
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