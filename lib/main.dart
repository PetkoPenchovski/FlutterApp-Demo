import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutterapp/app_screens/firs_screen.dart';

// Entry point of the App.Inflate the widget and attached to the screen
void main() => runApp(new MyFlutterApp());

//subclass            superclass
class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Flutter App",
      home: Scaffold(
          appBar: AppBar(
            title: Text("My First App Screen"),
          ),
          body: FirstScreen()),
    );
  }
}
