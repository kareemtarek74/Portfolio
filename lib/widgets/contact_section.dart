import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/sizes.dart';
import 'package:kareem_portfolio/constants/sms_links.dart';
import 'package:kareem_portfolio/widgets/custom_text_field.dart';
import 'package:kareem_portfolio/widgets/main_button.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLightk,
      child: Column(
        children: [
          Text(
            "Get In Touch",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: CustomColor.whitePrimary),
          ),
          SizedBox(
            height: 50,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700, maxHeight: 100),
            child: LayoutBuilder(
              builder: (context, Constraints) {
                if (Constraints.maxWidth >= kMinDisktopWidth) {
                  return buildNameAndEmailFieldsDesktop();
                } else {
                  return buildNameAndEmailFieldsMobile();
                }
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: CustomTextField(
              hintText: "Your Message",
              maxLines: 16,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: SizedBox(
                width: double.maxFinite, height: 40, child: MainButton()),
          ),
          SizedBox(
            height: 30,
          ),
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 300), child: Divider()),
          SizedBox(
            height: 15,
          ),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod(
                    "open",
                    [SmsLinks.gmailLink],
                  );
                },
                child: SvgPicture.asset("assets/images/Gmail.svg",
                    height: 24, width: 24),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod(
                    "open",
                    [SmsLinks.whatsappLink],
                  );
                },
                child: SvgPicture.asset("assets/images/whatsapp.svg",
                    height: 28, width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod(
                    "open",
                    [SmsLinks.githubLink],
                  );
                },
                child: SvgPicture.asset("assets/images/github.svg",
                    height: 28, width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod(
                    "open",
                    [SmsLinks.linkedinLink],
                  );
                },
                child: SvgPicture.asset("assets/images/linkedin.svg",
                    height: 28, width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod(
                    "open",
                    [SmsLinks.instagramLink],
                  );
                },
                child: SvgPicture.asset("assets/images/instgram.svg",
                    height: 27, width: 28),
              ),
            ],
          )
        ],
      ),
    );
  }

  Row buildNameAndEmailFieldsDesktop() {
    return Row(
      children: [
        Flexible(
            child: CustomTextField(
          hintText: "Your Name",
        )),
        SizedBox(
          width: 15,
        ),
        Flexible(
            child: CustomTextField(
          hintText: "Your Email",
        )),
      ],
    );
  }

  Column buildNameAndEmailFieldsMobile() {
    return Column(
      children: [
        Flexible(
            child: CustomTextField(
          hintText: "Your Name",
        )),
        SizedBox(
          height: 15,
        ),
        Flexible(
            child: CustomTextField(
          hintText: "Your Email",
        )),
      ],
    );
  }
}
