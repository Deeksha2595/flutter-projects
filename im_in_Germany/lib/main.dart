import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: Text("I'm in Germany",style: TextStyle(color: Colors.white),),backgroundColor: Colors.blueAccent,),
      body: Center(
        child: Image(image: AssetImage('assets/soft-pretzel-isolated-transparent-background-png-psd_888962-643.png'),
        ),
      ),
    )
  ));
}

