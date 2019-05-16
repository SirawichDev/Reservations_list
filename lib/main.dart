import 'package:flutter/material.dart';
import './Screen/HomeScreen/TopPart.dart';
import './Screen/HomeScreen/BottomPart.dart';
import './Components/AppBar/AppBar.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
Future<void> main() async {
  final FirebaseApp app = await FirebaseApp.configure(
      name: 'flight-list-flutter',
      options: Platform.isIOS ? const FirebaseOptions(
        googleAppID: '1:459938971668:ios:7b18f5f9713d8257',
        gcmSenderID: '459938971668',
        databaseURL: 'https://flight-list-flutter.firebaseio.com/'
      ) : const FirebaseOptions(
        googleAppID: '1:459938971668:android:7b18f5f9713d8257',
        apiKey: 'AIzaSyAnXlgd2jVpSTlT5KEN0u2zO5smrygJn8c',
        databaseURL: 'https://flight-list-flutter.firebaseio.com/'
      ));
  runApp(MaterialApp(
    title: "Flight List",
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

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
