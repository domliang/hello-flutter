import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String _name = "Dom Liang";


class HomePage extends StatefulWidget {                     
  @override                                                       
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
        ),
        Expanded(
          child: FlareActor(
            "assets/Sushi.flr",
            animation: "Sushi Bounce",
          ),
        ),
        // new FlareActor(
        //     "assets/Sushi.flr2d",
        //     animation: "Sushi Bounce",
        //     alignment: Alignment.center,
        //     fit: BoxFit.contain,
        //     // animation: "idle",
        //   ),
      ],                                                         
    ),
    );
  }
}

