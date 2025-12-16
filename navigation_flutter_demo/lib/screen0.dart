import 'package:flutter/material.dart';
import 'package:navigation_flutter_demo/screen1.dart';
import 'package:navigation_flutter_demo/screen2.dart';

class Screen0 extends StatelessWidget {
  const Screen0({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Screen 0'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,   // replaces 'color'
                foregroundColor: Colors.white,  // text/icon color
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/first');
              },
              child: const Text('Go To Screen 1'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,   // replaces 'color'
                foregroundColor: Colors.white,  // text/icon color
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Go To Screen 2'),
            ),
          ],
        ),
      ),
    );
  }
}
