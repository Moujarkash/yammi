import 'package:flutter/material.dart';
import 'package:yammi/presentation/resources/colors.dart';

class RateBar extends StatelessWidget {
  final int rate;
  final int total;

  const RateBar({Key? key, required this.rate, this.total = 5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 3,
      children: List<Widget>.generate(total, (index) => _rateStar(filled: index < rate)),
    );
  }

  Widget _rateStar({bool filled = false}){
    return Container(
      width: 19,
      height: 19,
      decoration: BoxDecoration(
        color: filled ? secondaryColor : Colors.transparent,
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(9.5)
      ),
    );
  }
}