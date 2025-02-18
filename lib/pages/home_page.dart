import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/sizes.dart';
import 'package:kareem_portfolio/widgets/contact_section.dart';
import 'package:kareem_portfolio/widgets/footer_section.dart';
import 'package:kareem_portfolio/widgets/header_desktop.dart';
import 'package:kareem_portfolio/widgets/header_mobile.dart';
import 'package:kareem_portfolio/widgets/main_desktop.dart';
import 'package:kareem_portfolio/widgets/main_mobile.dart';
import 'package:kareem_portfolio/widgets/mobile_drawer.dart';
import 'package:kareem_portfolio/widgets/projects_section.dart';
import 'package:kareem_portfolio/widgets/skills_desktop.dart';
import 'package:kareem_portfolio/widgets/skills_mobile.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final screenWidth = screenSize.width;
    return LayoutBuilder(builder: (context, Constraints) {
      return Scaffold(
        key: scaffoldKey,
        endDrawer: Constraints.maxWidth >= kMinDisktopWidth
            ? null
            : const MobileDrawer(),
        backgroundColor: CustomColor.scaffoldBg,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            //main
            if (Constraints.maxWidth >= kMinDisktopWidth)
              const HeaderDesktop()
            else
              HeaderMobile(
                onLogoTap: () {},
                onMenuTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
              ),
            if (Constraints.maxWidth >= kMinDisktopWidth)
              MainDeskTop(screenSize: screenSize, screenWidth: screenWidth)
            else
              MainMobile(screenSize: screenSize, screenWidth: screenWidth),
            //skills
            Container(
              width: screenWidth,
              color: CustomColor.bgLightk,
              padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'What I can do',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  if (Constraints.maxWidth >= kMedDisktopWidth)
                    SkillsDeskTop()
                  else
                    SkillsMobile()
                ],
              ),
            ),
            //projects
            SizedBox(
              height: 20,
            ),
            ProjectsSection(screenWidth: screenWidth),
            // contact
            SizedBox(
              height: 20,
            ),
            ContactSection(),
            //footer
            FooterSection(),
          ],
        ),
      );
    });
  }
}
