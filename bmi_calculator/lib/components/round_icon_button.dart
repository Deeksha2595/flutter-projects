import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final void Function() onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints().tighten(height: 50, width: 50),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 8.0,
      child: icon,
    );
  }
}
