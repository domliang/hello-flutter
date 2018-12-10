import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String _name = "Dom Liang";


class HomePage extends StatefulWidget {                     //modified
  @override                                                        //new
  State createState() => new HomePageState();                    //new
} 

class HomePageState extends State<HomePage> with TickerProviderStateMixin {

  void _handleSubmitted() {
    print('btn pressed');   
    Navigator.pushNamed(context, '/chatRoom');                   
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter lite'),
      ),
      body: new Column(                                       
      children: <Widget>[                                         
        new CupertinoButton(
          child: Text('go to chat'),
          onPressed: this._handleSubmitted,
        )                                                      
      ],                                                         
    ),
    );
  }
}
