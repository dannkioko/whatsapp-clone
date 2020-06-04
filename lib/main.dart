import 'package:flutter/material.dart';
import 'package:whatsappclone/screens/home_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: "WhatsApp",
        theme: ThemeData(
          accentColor: Color(0xff25D366),
          primaryColor: Color(0xff075E54),
        ),
        home: HomeScreen(),);
  }
}
