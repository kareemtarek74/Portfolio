import 'package:flutter/material.dart';
import 'package:kareem_portfolio/pages/home_page.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const KareemPortfolio());
}

class KareemPortfolio extends StatelessWidget {
  const KareemPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        title: 'Kareem Portfolio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: HomePage(),
      );
    });
  }
}
