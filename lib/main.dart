import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/screens/home_screen.dart';
import 'package:whatsappclone/screens/login/login_screen.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(MyApp());}
  
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
    home:LoginScreen(cameras),
    // home: HomeScreen(cameras),
  );
}
  }
