import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:karc_pf/constants.dart';

class SkillWidget extends StatelessWidget {
  final String skill;
  final double percentual;
  const SkillWidget({Key? key, required this.skill, required this.percentual})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: 500,
      child: Column(
        children: [
          Text(skill),
          FAProgressBar(
            currentValue: percentual,
            displayText: '%',
            progressColor: primaryColor,
            backgroundColor: Colors.white38,
            animatedDuration: const Duration(seconds: 1),
          )
        ],
      ),
    );
  }
}
