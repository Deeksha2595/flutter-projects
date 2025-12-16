import 'package:flutter/material.dart';
import '../support_files/constants.dart';

class IconContent extends StatelessWidget {
  final Icon icon;
  final String txt;

  const IconContent({super.key, required this.icon, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(height: 8),
        Text(txt, style: kLabelTextStyle),
      ],
    );
  }
}
