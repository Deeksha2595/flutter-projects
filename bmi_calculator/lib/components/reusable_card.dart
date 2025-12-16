import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color? colour;
  final Widget? cardChild;
  final void Function()? onTapCard;

  const ReusableCard({
    super.key,
    required this.colour,
    required this.cardChild,
    required this.onTapCard,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCard,
      child: Container(
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(top: 7, bottom: 7, left: 5, right: 5),
        child: cardChild,
      ),
    );
  }
}
