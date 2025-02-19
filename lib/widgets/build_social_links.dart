import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/sms_links.dart';
import 'package:kareem_portfolio/widgets/build_social_icon.dart';

Widget buildSocialLinks() {
  return Wrap(
    spacing: 15,
    runSpacing: 15,
    alignment: WrapAlignment.center,
    children: [
      buildSocialIcon("assets/images/Gmail.svg", SmsLinks.gmailLink, 24),
      buildSocialIcon("assets/images/whatsapp.svg", SmsLinks.whatsappLink, 28),
      buildSocialIcon("assets/images/github.svg", SmsLinks.githubLink, 28),
      buildSocialIcon("assets/images/linkedin.svg", SmsLinks.linkedinLink, 28),
      buildSocialIcon("assets/images/instgram.svg", SmsLinks.instagramLink, 27),
    ],
  );
}
