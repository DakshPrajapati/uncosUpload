import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uncos_upload/mainNews.dart';

import 'Screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homeS(),
    );
  }
}

class homeS extends StatefulWidget {
  @override
  _homeSState createState() => _homeSState();
}

class _homeSState extends State<homeS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0C2132),
      appBar: AppBar(
        backgroundColor: Color(0xff0C2132),
        elevation: 0,
        title: Text("logo"),
        centerTitle: true,
      ),
      body: HomeScreen(),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        backgroundColor: Color(0xff8921aa),
        child: Icon(
          Icons.chevron_right,
          color: Color(0xff0C2132),
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MainNews()));
        },
      ),
    );
  }
}
