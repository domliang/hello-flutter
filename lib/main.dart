// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'views/chatroompage.dart';
import 'views/homepage.dart';

void main() {
  runApp(HelloFlutterApp());
}

class HelloFlutterApp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      title: 'hello flutter',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
        '/chatRoom': (BuildContext context) => ChatRoomPage(),
      }
    );
  }
}
