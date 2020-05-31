import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

void main(){
  //Inflate the widget and attached to the screen
  runApp(
      Center(
          child: Text
        (
        "Hello Flutter", textDirection: TextDirection.ltr,
          )
      )
  );
}