import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  Widget buildKey(int num, Color col)
    => Expanded(
      child: GestureDetector(
        onTap: () {
          var player = AudioPlayer();
          player.play(AssetSource('note$num.wav'));
        },
        child: Container(color: col,),
      ),
    );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              buildKey(1,Colors.red),
              buildKey(2,Colors.orange),
              buildKey(3,Colors.yellow),
              buildKey(4,Colors.green),
              buildKey(5,Colors.teal),
              buildKey(6,Colors.blue),
              buildKey(7,Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}


