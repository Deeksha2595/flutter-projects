import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red[50],
        appBar: AppBar(
          title: Text("I am Rich", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.redAccent,
        ),
        body: Center(child: Image(image: AssetImage('images/img.png'))),
      ),
    ),
  );
}
