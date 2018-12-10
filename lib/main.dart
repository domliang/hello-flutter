import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String _name = "Dom Liang";

void main() => runApp(HelloFlutter());

class HelloFlutter extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      title: 'hello flutter',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
      }
    );
  }
}

class HomePage extends StatefulWidget {                     //modified
  @override                                                        //new
  State createState() => new HomePageState();                    //new
} 

class HomePageState extends State<HomePage> with TickerProviderStateMixin {

  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  Widget _buildTextComposer() {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(                                            //new
        children: <Widget>[                                    //new
          new Flexible(                                          //new
            child: new TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: new InputDecoration.collapsed(
                hintText: "Send a message"),
            ),
          ),
          new Container(                                                 //new
            margin: new EdgeInsets.symmetric(horizontal: 4.0),           //new
            child: new IconButton(                                       //new
              icon: new Icon(Icons.send),                                //new
              onPressed: () => _handleSubmitted(_textController.text)),  //new
          ),                                                      //new
        ],                                                        //new
      ),                                                          //new
    );
  }

  void _handleSubmitted(String text) {
    print(text);
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      nickName: _name,
      animationController: new AnimationController(                  //new
        duration: new Duration(milliseconds: 700),                   //new
        vsync: this,                                                 //new
      ),                                                             //new
    );                                                               //new
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();                           //new
  }

  @override
  void dispose() {                                                   //new
    for (ChatMessage message in _messages)                           //new
      message.animationController.dispose();                         //new
    super.dispose();                                                 //new
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Chat lite'),
      ),
      body: new Column(                                        //modified
      children: <Widget>[                                         //new
        new Flexible(                                             //new
          child: new ListView.builder(                            //new 
            padding: new EdgeInsets.all(8.0),                     //new
            reverse: true,                                        //new
            itemBuilder: (_, int index) => _messages[index],      //new
            itemCount: _messages.length,                          //new
          ),                                                      //new
        ),                                                        //new
        new Divider(height: 1.0),                                 //new
        new Container(                                            //new
          decoration: new BoxDecoration(
            color: Theme.of(context).buttonColor),                  //new
          child: _buildTextComposer(),                       //modified
        ),                                                        //new
      ],                                                          //new
    ),
    );
  }
}



class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.nickName, this.animationController});
  final String text;
  final AnimationController animationController;
  final String nickName;
  @override
  Widget build(BuildContext context) {
    return new SizeTransition(                                    //new
    sizeFactor: new CurvedAnimation(                              //new
        parent: animationController, curve: Curves.easeOut),      //new
    axisAlignment: 0.0,                                           //new
    child: new Container(                                    //modified
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text(nickName[0])),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(nickName, style: Theme.of(context).textTheme.subhead),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(text),
                ),
              ],
            ),
          ],
        ),
      )                                                           //new
    );
  }
}
