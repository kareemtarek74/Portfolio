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
  final ScrollController scrollController = ScrollController();
  final List<GlobalKey> navBarKeys = List.generate(4, (index) => GlobalKey());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final screenWidth = screenSize.width;
    return LayoutBuilder(builder: (context, Constraints) {
      return Scaffold(
        key: scaffoldKey,
        endDrawer: Constraints.maxWidth >= kMinDisktopWidth
            ? null
            : MobileDrawer(
                onNavItemClicked: (int navIndex) {
                  scaffoldKey.currentState?.closeEndDrawer();
                  scrollToSection(navIndex);
                },
              ),
        backgroundColor: CustomColor.scaffoldBg,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: scrollController,
          child: Column(
            children: [
              SizedBox(
                key: navBarKeys.first,
              ),
              //main
              if (Constraints.maxWidth >= kMinDisktopWidth)
                HeaderDesktop(
                  onNavMenuClicked: (int navIndex) {
                    scrollToSection(navIndex);
                  },
                )
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              if (Constraints.maxWidth >= kMinDisktopWidth)
                MainDeskTop(
                  screenSize: screenSize,
                  screenWidth: screenWidth,
                  onPressed: () {
                    scrollToSection(3);
                  },
                )
              else
                MainMobile(
                  screenSize: screenSize,
                  screenWidth: screenWidth,
                  onPressed: () => scrollToSection(3),
                ),
              //skills
              Container(
                key: navBarKeys[1],
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
              ProjectsSection(
                screenWidth: screenWidth,
                key: navBarKeys[2],
              ),
              // contact
              SizedBox(
                height: 20,
              ),
              ContactSection(
                key: navBarKeys[3],
              ),
              //footer
              FooterSection(),
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) return;

    final key = navBarKeys[navIndex];
    final context = key.currentContext;

    if (context != null) {
      final renderObject = context.findRenderObject();
      if (renderObject is RenderBox) {
        final position = renderObject.localToGlobal(Offset.zero).dy;
        scrollController.animateTo(
          position + scrollController.offset,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
      }
    }
  }
}
