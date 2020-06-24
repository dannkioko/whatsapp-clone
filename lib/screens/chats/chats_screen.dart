import 'package:flutter/material.dart';
import 'package:whatsappclone/models/chats.dart';

import 'chats_detail_screen.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    var names = [];
    var distinctNames = [];
    var distinctChats=[];
    for (var i = 0; i <chats.length; i++) {
      var chat = chats[i];
      var name = chat.fromcontactName;
      names.add(name);
    }
    distinctNames = names.toSet().toList();

    for (var i = 0; i <distinctNames.length; i++) {
      var name = distinctNames[i];
      for (var i = 0; i <chats.length; i++){
        var chat = chats[i];
        if(name==chat.fromcontactName){
          distinctChats.add(chat);
        }
      }
    }
    return ListView.builder(
        itemCount: distinctChats.length,
        itemBuilder: (BuildContext context, int index) {
          Chat chat = distinctChats[index];
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ChatsDetailScreen(
                          chat: chat,
                        ))),
            child: Column(children: <Widget>[
              Divider(
                height: 10.0,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundImage: AssetImage(chats[index].imgUrl),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      chats[index].fromcontactName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      chats[index].time,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                subtitle: Container(
                  child: Text(chats[index].message),
                ),
              )
            ]),
          );
        });
  }
}
