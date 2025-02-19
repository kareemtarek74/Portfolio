import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildSocialIcon(String assetPath, String link, double height) {
  return InkWell(
    onTap: () {
      js.context.callMethod("open", [link]);
    },
    child: SvgPicture.asset(
      assetPath,
      height: height,
      width: height,
    ),
  );
}
