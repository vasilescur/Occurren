import 'package:flutter/material.dart';

import 'package:occurren/profile.dart';
import 'package:occurren/matches.dart';
import 'package:occurren/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

ThemeData androidTheme = new ThemeData(
    primarySwatch: Colors.red,
    primaryColorBrightness: Brightness.dark,
    accentColor: Colors.yellowAccent);

ThemeData iosTheme = new ThemeData(
    primarySwatch: Colors.red,
    primaryColorBrightness: Brightness.dark,
    accentColor: Colors.yellowAccent);


void main() {
  runApp(new MaterialApp(
    home: new MainPage(),
    theme: androidTheme,
  ));
}

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage> {
  int currentTab = 0;
  Profile pageOne = new Profile();
  Matches pageTwo = new Matches();
  ChatScreen pageThree = new ChatScreen();

  List<Widget> pages;
  Widget currentPage;

  static String currentUserId = 'h3cvKGkK8TUr4UCwatzV';

  @override
  void initState() {
    super.initState();
    pages = [pageOne, pageTwo, pageThree];
    currentPage = pageOne;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final BottomNavigationBar navBar = new BottomNavigationBar(
      currentIndex: currentTab,
      onTap: (int numTab) {
        setState(() {
          currentTab = numTab;
          currentPage = pages[numTab];
        });
      },
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            icon: new Icon(Icons.face), title: new Text("Profile")),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.people), title: new Text("Matches")),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.message), title: new Text("Chats"))
      ],
    );

    return new Scaffold(
      bottomNavigationBar: navBar,
      body: currentPage,
    );
  }
}