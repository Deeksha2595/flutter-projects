import 'package:flutter/material.dart';
class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Screen 1'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,   // replaces 'color'
            foregroundColor: Colors.white,  // text/icon color
          ),
          child: Text('Go Forwards To Screen 2'),
          onPressed: () {
            Navigator.pushNamed(context,'/second');
          },
        ),
      ),
    );
  }
}
