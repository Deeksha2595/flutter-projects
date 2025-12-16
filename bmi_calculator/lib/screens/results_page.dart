import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
import '../support_files/constants.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    super.key,
    required this.result,
    required this.bmi,
    required this.interpretation,
  });

  final String result, bmi, interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
          style: kLabelTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Center(child: Text("Result", style: kTitleStyle)),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: kActiveCardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(result, style: kResultTextStyle),
                  Text(bmi, style: kBMITextStyle),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            text: 'Re-Calculate BMI',
          ),
        ],
      ),
    );
  }
}
