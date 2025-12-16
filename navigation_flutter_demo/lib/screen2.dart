import 'package:flutter/material.dart';
import 'package:navigation_flutter_demo/screen1.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Screen 2'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,   // replaces 'color'
            foregroundColor: Colors.white,  // text/icon color
          ),          child: Text('Go Back To Screen 1'),
          onPressed: () {
            Navigator.pushNamed(context,'/first');
          },
        ),
      ),
    );
  }
}
