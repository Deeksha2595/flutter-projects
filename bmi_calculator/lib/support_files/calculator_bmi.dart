import 'dart:math';

class CalculateBMI {
  late int weight;
  late int height;
  late double _bmi;

  CalculateBMI({required int h, required int w}) {
    height = h;
    weight = w;
    _bmi = weight / pow((height / 100), 2);
  }

  String getBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi < 18.5) {
      return "Underweight";
    } else if (_bmi < 24.9) {
      return "Normal";
    } else if (_bmi < 29.9) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  String getInterpretation() {
    if (_bmi < 18.5) {
      return "You are underweight, which may indicate nutritional deficiency or low body mass.";
    } else if (_bmi < 24.9) {
      return "You are in the normal BMI range and have a healthy body weight.";
    } else if (_bmi < 29.9) {
      return "You are overweight, which may increase the risk of health issues if unmanaged.";
    } else {
      return "You fall in the obese range, which carries a higher risk of weight-related health problems.";
    }
  }
}
