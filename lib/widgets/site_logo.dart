import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'KT',
        style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: CustomColor.yellowSecondary),
      ),
    );
  }
}
