import 'package:flutter/material.dart';
import 'package:whatsappclone/models/chats.dart';

class ChatsDetailScreen extends StatefulWidget {
  final Chat chat;

  ChatsDetailScreen({this.chat});
  @override
  _ChatsDetailScreenState createState() => _ChatsDetailScreenState();
}

class _ChatsDetailScreenState extends State<ChatsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECE5DD),
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              child: Text("Image"),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(widget.chat.tocontactName)
          ],
        ),
      ),
      body: Column(
        children: <Widget>[Expanded(child: ListView()), Row()],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 8.0),
                      Icon(Icons.insert_emoticon,
                          size: 30.0, color: Theme.of(context).hintColor),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Type a message',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(Icons.attach_file,
                          size: 30.0, color: Theme.of(context).hintColor),
                      SizedBox(width: 8.0),
                      Icon(Icons.camera_alt,
                          size: 30.0, color: Theme.of(context).hintColor),
                      SizedBox(width: 8.0),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                child: Icon(Icons.send),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
