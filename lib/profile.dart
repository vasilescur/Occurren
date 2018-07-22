import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(title: new Text("Profile")),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Profile Pic
            new Padding(
              padding: EdgeInsets.all(20.0),
              child: new Image.network(
                "https://avatars3.githubusercontent.com/u/10100323?s=460&v=4",
                width: 150.0,
              ),
            ),

            // Details
            new Text(
              "Radu Vasilescu",
              style: new TextStyle(fontSize: 30.0),
            ),
            new Text(
              "Cincinnati, OH",
              style: new TextStyle(fontSize: 24.0),
            ),
            new Text(
              "17 years old",
              style: new TextStyle(fontSize: 18.0),
            ),

            // Interests
            new Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: new Column(
                children: <Widget>[
                  new Text("Programming"),
                  new Text("Video Games"),
                  new Text("Movies"),
                ],
              ),
            ),            
          ],
        )
      )
    );
  }
}