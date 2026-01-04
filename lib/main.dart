import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/pages/home_page.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const KareemPortfolio());
}

class KareemPortfolio extends StatelessWidget {
  const KareemPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Kareem Portfolio',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: CustomColor.scaffoldBg,
            textTheme: GoogleFonts.interTextTheme(
              ThemeData.dark().textTheme,
            ),
            colorScheme: ColorScheme.dark(
              primary: CustomColor.gradientMid,
              secondary: CustomColor.accentPurple,
              surface: CustomColor.bgLightk,
            ),
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
