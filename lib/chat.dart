import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

var rough = Set();
var temp = [];
var user = 0;

const String _name = "Radu Vasilescu";

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[]; // new
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    messagelistener();
    return new Scaffold(
      appBar: new AppBar(title: new Text("Friendlychat")),
      body: new Column(
        //modified
        children: <Widget>[
          //new
          new Flexible(
            //new
            child: new ListView.builder(
              //new
              padding: new EdgeInsets.all(8.0), //new
              reverse: true, //new
              itemBuilder: (_, int index) => _messages[index], //new
              itemCount: _messages.length, //new
            ), //new
          ), //new
          new Divider(height: 1.0), //new
          new Container(
            //new
            decoration:
                new BoxDecoration(color: Theme.of(context).cardColor), //new
            child: _buildTextComposer(), //modified
          ), //new
        ], //new
      ), //new
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    print("Called");
    Firestore.instance.collection('messages').document().setData(
        {'id': user, 'm': text, 't': new DateTime.now().millisecondsSinceEpoch});
    _textController.clear();
    setState(() {}); //new
  }

  void messagelistener() {
    Query reference = Firestore.instance.collection('messages').orderBy("t");
    reference.snapshots().listen((querySnapshot) {
      querySnapshot.documentChanges.forEach((change) {
        if (!rough.contains(change.document['t'])) {
          rough.add(change.document['t']);
          if (change.document['id'] == user){
            ChatMessage cm =
                new ChatMessage(text: change.document['m'], isUser: true);
            setState(() {
              _messages.insert(0, cm);
            });
          } else {
            ChatMessage cm =
                new ChatMessage(text: change.document['m'], isUser: false);
            setState(() {
              _messages.insert(0, cm);
            });
          }
          print(change.document['m']);
        }
      });
    });
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      //new
      data: new IconThemeData(color: Theme.of(context).accentColor), //new
      child: new Container(
        //modified
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ), //new
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.isUser});
  final String text;
  bool isUser;
  @override
  Widget build(BuildContext context) {
    if (isUser) {
      return new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                new Container(
                  child: new Text(_name,
                      style: Theme.of(context).textTheme.subhead),
                  margin: const EdgeInsets.only(right: 5.0),
                ),
                new Align(
                  alignment: Alignment.centerRight,
                  child: new Container(
                    margin: const EdgeInsets.only(top: 5.0, right: 5.0),
                    child: new Text(text),
                  ),
                )
              ],
            ),
            new Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(right: 1.0),
                child: new CircleAvatar(
                  child: new Text(_name[0]),
                  radius: 20.0,
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(
                child: new Text(_name[0]),
                radius: 20.0,
              ),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_name, style: Theme.of(context).textTheme.subhead),
                new Align(
                  alignment: Alignment.centerLeft,
                  child: new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(text),
                    width: MediaQuery.of(context).size.width - 72,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }
  }
}