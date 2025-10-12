import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text(
            'Dicee',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.red[900],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNumber = 1, rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  pressedBtn();
                });
              },
              child: Image.asset('assets/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  pressedBtn();
                });
              },
              child: Image.asset('assets/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }

  void pressedBtn() {
    rightDiceNumber = Random().nextInt(6) + 1;
    leftDiceNumber = Random().nextInt(6) + 1;
  }
}

// class DicePage extends StatelessWidget {
//   const DicePage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     var leftDiceNumber = 1, rightDiceNumber = 1;
//     return Center(
//       child: Row(
//         children: [
//           Expanded(
//             child: TextButton(
//                 onPressed: () {
//                   print("Left button got pressed");
//                   leftDiceNumber++;
//                   if(leftDiceNumber>6) leftDiceNumber=1;
//                 },
//                 child: Image.asset('assets/dice$leftDiceNumber.png')
//             ),
//           ),
//           Expanded(
//             child: TextButton(onPressed: () {
//               print("Right button got pressed");
//               if(rightDiceNumber>6) rightDiceNumber=1;
//             },
//                 child: Image.asset('assets/dice$rightDiceNumber.png')),
//           ),
//         ],
//       ),
//     );
//   }
// }
