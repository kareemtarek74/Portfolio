import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/skills_items.dart';
import 'package:kareem_portfolio/widgets/skills_languages.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500),
      child: Column(
        children: [
          for (int i = 0; i < platformItems.length; i++)
            Container(
              margin: EdgeInsets.only(bottom: 5),
              width: double.maxFinite,
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
            ),
          SizedBox(
            height: 50,
          ),
          SkillsLanguages(
            alignment: WrapAlignment.center,
          ),
        ],
      ),
    );
  }
}
