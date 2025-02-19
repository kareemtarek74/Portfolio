import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/sizes.dart';
import 'package:kareem_portfolio/services/email_service.dart'; // We'll create this file
import 'package:kareem_portfolio/utils/validation_utils.dart'; // We'll create this file
import 'package:kareem_portfolio/widgets/build_name_and_email_desktop.dart';
import 'package:kareem_portfolio/widgets/build_name_and_email_mobile.dart';
import 'package:kareem_portfolio/widgets/build_social_links.dart';
import 'package:kareem_portfolio/widgets/build_success_message.dart';
import 'package:kareem_portfolio/widgets/custom_text_field.dart';
import 'package:kareem_portfolio/widgets/main_button.dart';
import 'package:sizer/sizer.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({
    super.key,
  });

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  bool isLoading = false;
  String? errorMessage;
  bool messageSent = false;
  final EmailService emailService = EmailService();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  Future<void> sendMessage() async {
    if (nameController.text.trim().isEmpty) {
      setState(() {
        errorMessage = "Please enter your name";
      });
      return;
    }

    if (!ValidationUtils.isValidEmail(emailController.text)) {
      setState(() {
        errorMessage = "Please enter a valid email";
      });
      return;
    }

    if (messageController.text.trim().isEmpty) {
      setState(() {
        errorMessage = "Please enter your message";
      });
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final result = await emailService.sendContactEmail(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        message: messageController.text.trim(),
      );

      if (result.success) {
        setState(() {
          messageSent = true;
          isLoading = false;
          nameController.clear();
          emailController.clear();
          messageController.clear();
        });
      } else {
        setState(() {
          errorMessage = result.errorMessage ??
              "Failed to send message. Please try again.";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "An error occurred. Please try again later.";
        isLoading = false;
      });
    }
  }

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
          SizedBox(height: 50),
          if (messageSent) buildSuccessMessage() else buildContactForm(),
          SizedBox(height: 30),
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 300), child: Divider()),
          SizedBox(height: 15),
          buildSocialLinks(),
        ],
      ),
    );
  }

  Widget buildContactForm() {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 700, maxHeight: 100),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= kMinDisktopWidth) {
                return buildNameAndEmailFieldsDesktop(
                    nameController, emailController);
              } else {
                return buildNameAndEmailFieldsMobile(
                    nameController, emailController);
              }
            },
          ),
        ),
        SizedBox(height: 15),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 700),
          child: CustomTextField(
            hintText: "Your Message",
            maxLines: 13,
            controller: messageController,
          ),
        ),
        if (errorMessage != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              errorMessage!,
              style: TextStyle(color: Colors.red[400], fontSize: 14),
            ),
          ),
        SizedBox(height: 20),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 700),
          child: SizedBox(
              width: double.maxFinite,
              height: 40,
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : MainButton(
                      fontSize: 13.sp,
                      onPressed: sendMessage,
                    )),
        ),
      ],
    );
  }
}
