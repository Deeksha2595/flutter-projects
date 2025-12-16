import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../components/round_icon_button.dart';
import '../support_files/constants.dart';
import '../support_files/calculator_bmi.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor,
      femaleCardColor = kInactiveCardColor;

  void updateColor(Gender gender) {
    maleCardColor = (gender == Gender.male)
        ? kActiveCardColor
        : kInactiveCardColor;
    femaleCardColor = (gender == Gender.female)
        ? kActiveCardColor
        : kInactiveCardColor;
  }

  Gender? selectedGender;
  int height = 100;
  int weight = 30;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(
          'BMI CALCULATOR',
          style: kLabelTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onTapCard: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: (selectedGender == Gender.male)
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: Icon(FontAwesomeIcons.mars, size: 50),
                      txt: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTapCard: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: (selectedGender == Gender.female)
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: Icon(FontAwesomeIcons.venus, size: 50),
                      txt: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Height", style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text("$height", style: kNumberStyle),
                      Text("cm", style: kLabelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                      activeTrackColor: Colors.white,
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                      overlayColor: Color(0x298D8E98),
                      thumbColor: Color(0xFFEB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      trackHeight: 1.7,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 300,
                      autofocus: true,
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              onTapCard: null,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Weight", style: kLabelTextStyle),
                        Text("$weight", style: kNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 0) weight--;
                                });
                              },
                              icon: Icon(FontAwesomeIcons.minus),
                            ),
                            SizedBox(width: 10),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: Icon(FontAwesomeIcons.plus),
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kActiveCardColor,
                    onTapCard: null,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Age", style: kLabelTextStyle),
                        Text("$age", style: kNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  if (age > 0) age--;
                                });
                              },
                              icon: Icon(FontAwesomeIcons.minus),
                            ),
                            SizedBox(width: 10),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: Icon(FontAwesomeIcons.plus),
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kActiveCardColor,
                    onTapCard: () {},
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculateBMI cal = CalculateBMI(h: height, w: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    result: cal.getResult(),
                    interpretation: cal.getInterpretation(),
                    bmi: cal.getBMI(),
                  ),
                ),
              );
            },
            text: 'Calculate BMI',
          ),
        ],
      ),
    );
  }
}
