import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Screen/HomeScreen/TopPart.dart';
import './Screen/HomeScreen/BottomPart.dart';

void main() => runApp(MaterialApp(
      title: "Flight List",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ));

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[HomeTop(), HomeBottom()],
      ),
    );
  }
}
