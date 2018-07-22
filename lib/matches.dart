import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:occurren/main.dart';

class Matches extends StatefulWidget {
  Matches({Key key}) : super(key: key);

  @override
  _MatchesState createState() {
    return new _MatchesState()..updateMatches();
  }
}

class _MatchesState extends State<Matches> {
  var matchesList = new List();

  void _addMatch(var match) {
    setState(() {
      matchesList.add(match);
    });
  }
  
  void updateMatches() {
    var matches = http.get('http://10.1.104.132:3000/connections/mine?user_id=${MainPageState.currentUserId}').then((response) {

      var matches_list = jsonDecode(response.body);

      print(matches_list);

      for (var match_id in matches_list) {
        var match = http.get('http://10.1.104.132:3000/users?user_id=${match_id}').then((match_details_res) {
          var match_details = jsonDecode(match_details_res.body);
          _addMatch(match_details);
        });
      }
    });
  }

  String _listPrettyStr(List list) {
    String result = "";

    result = list[0].toString();

    for (int i = 1; i < list.length; i++) {
      result = '${result}, ${list[i].toString()}';
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Matches"),
      ),
      body: new ListView(
        children: matchesList.map((match) {
          return new ListTile(
            leading: new Icon(Icons.face),
            title: new Text('${match['name_first']} ${match['name_last']}'),
            subtitle: new Text("${match['age']} years old, 1.2 miles away.\nInterests: ${_listPrettyStr(match['interests'])}"),
            isThreeLine: true,

            onTap: () {
              print('Tile tapped!');
            }
          );
        }).toList(),
      ),
    );
  }
}