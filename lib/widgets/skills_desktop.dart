import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/skills_items.dart';
import 'package:kareem_portfolio/widgets/skills_languages.dart';

class SkillsDeskTop extends StatelessWidget {
  const SkillsDeskTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 450),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              for (int i = 0; i < platformItems.length; i++)
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: CustomColor.bgLight2,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: SvgPicture.asset(
                      platformItems[i]["img"],
                      width: 26,
                    ),
                    title: Text(platformItems[i]["title"]),
                  ),
                )
            ],
          ),
        ),
        SizedBox(
          width: 50,
        ),
        Flexible(
          child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 430),
              child: SkillsLanguages()),
        )
      ],
    );
  }
}
