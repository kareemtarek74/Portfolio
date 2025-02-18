import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/skills_items.dart';

class SkillsLanguages extends StatelessWidget {
  const SkillsLanguages({
    super.key,
    this.alignment = WrapAlignment.start,
  });
  final WrapAlignment alignment;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: alignment,
      spacing: 10,
      runSpacing: 10,
      children: [
        for (int i = 0; i < skillsItems.length; i++)
          Chip(
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            backgroundColor: CustomColor.bgLight2,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            label: Text(skillsItems[i]["title"]),
            avatar: Image.asset(
              skillsItems[i]["img"],
            ),
          )
      ],
    );
  }
}
