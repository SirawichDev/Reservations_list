import 'package:flutter/material.dart';
import './Screen/HomeScreen/TopPart.dart';
import './Screen/HomeScreen/BottomPart.dart';
import './Components/AppBar/AppBar.dart';

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
      bottomNavigationBar: AppBarBottom(),
      body: Column(
        children: <Widget>[HomeTop(), HomeBottom()],
      ),
    );
  }
}
