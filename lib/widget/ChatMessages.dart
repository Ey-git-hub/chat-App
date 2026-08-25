import 'package:chat/widget/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget{
  ChatMessages({super.key});
  @override
  Widget build(BuildContext context) {
    final authenticatedUser=FirebaseAuth.instance.currentUser!;
    return StreamBuilder(stream: FirebaseFirestore.instance.collection('chat').orderBy('createdAt',descending: true).snapshots(), 
    builder: (ctx,chatsnapshot){
      if(chatsnapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }
    if(!chatsnapshot.hasData || chatsnapshot.data!.docs.isEmpty){
      return Center(
       child: Text("No text messgaes"),
    );
    }
    if (chatsnapshot.hasError){
          return Center(
       child: Text("No text messgaes"),
    );
        }

    final loadedmessages=chatsnapshot.data!.docs;
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 40,right: 13,left:13),
      reverse: true,
      itemCount: loadedmessages.length,itemBuilder:
      (ctx,index)
      // =>Text(loadedmessages[index].data()['text'])
      {
        final ChatMessage=loadedmessages[index].data();
        final nextchatmessage=index +1 <loadedmessages.length? loadedmessages[index].data():null ;
        final currentMessageUserId=ChatMessage['userId'];
        final nextMessageUserId=nextchatmessage!=null?nextchatmessage['userId']:null;

        final nextUserisSame=nextMessageUserId==currentMessageUserId;

        if(nextUserisSame){
          return MessageBubble.next(message: ChatMessage['text'], isMe: authenticatedUser.uid==currentMessageUserId);
        } else{
          return MessageBubble.first(userImage: ChatMessage['userImage'], username: ChatMessage['username'], message:ChatMessage['text'], isMe: authenticatedUser.uid==currentMessageUserId);
        }
      }
     ,);
    });
    
    
    
    
    
    
    
  
  }
}