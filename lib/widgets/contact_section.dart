import 'dart:convert';
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/sizes.dart';
import 'package:kareem_portfolio/constants/sms_links.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;
  bool _messageSent = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  bool _validateEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  Future<void> _sendMessage() async {
    if (_nameController.text.isEmpty) {
      setState(() {
        _errorMessage = "Please enter your name";
      });
      return;
    }

    if (_emailController.text.isEmpty ||
        !_validateEmail(_emailController.text)) {
      setState(() {
        _errorMessage = "Please enter a valid email";
      });
      return;
    }

    if (_messageController.text.isEmpty) {
      setState(() {
        _errorMessage = "Please enter your message";
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'service_id': 'service_ly647ch',
          'template_id': 'template_ls566ki',
          'user_id': 'E-X8YNp5nMjNKyVyA',
          'template_params': {
            'name': _nameController.text,
            'email': _emailController.text,
            'message': _messageController.text,
          }
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          _messageSent = true;
          _isLoading = false;
          _nameController.clear();
          _emailController.clear();
          _messageController.clear();
        });
      } else {
        setState(() {
          _errorMessage = "Failed to send message. Please try again.";
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = "An error occurred. Please try again later.";
        _isLoading = false;
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
                fontSize: 18.sp,
                color: CustomColor.whitePrimary),
          ),
          SizedBox(height: 50),
          if (_messageSent)
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "Thank you! Your message has been sent successfully. I'll get back to you soon in your gmail.",
                style: TextStyle(color: Colors.green[700]),
                textAlign: TextAlign.center,
              ),
            )
          else
            Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 700, maxHeight: 100),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth >= kMinDisktopWidth) {
                        return buildNameAndEmailFieldsDesktop();
                      } else {
                        return buildNameAndEmailFieldsMobile();
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
                    controller: _messageController,
                  ),
                ),
                if (_errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      _errorMessage!,
                      style: TextStyle(color: Colors.red[400], fontSize: 14),
                    ),
                  ),
                SizedBox(height: 20),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: SizedBox(
                      width: double.maxFinite,
                      height: 40,
                      child: _isLoading
                          ? Center(child: CircularProgressIndicator())
                          : MainButton(
                              onPressed: _sendMessage,
                              fontSize: 14.sp,
                            )),
                ),
              ],
            ),
          SizedBox(height: 30),
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 300), child: Divider()),
          SizedBox(height: 15),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            alignment: WrapAlignment.center,
            children: [
              buildSocialIcon(
                  "assets/images/Gmail.svg", SmsLinks.gmailLink, 24),
              buildSocialIcon(
                  "assets/images/whatsapp.svg", SmsLinks.whatsappLink, 28),
              buildSocialIcon(
                  "assets/images/github.svg", SmsLinks.githubLink, 28),
              buildSocialIcon(
                  "assets/images/linkedin.svg", SmsLinks.linkedinLink, 28),
              buildSocialIcon(
                  "assets/images/instgram.svg", SmsLinks.instagramLink, 27),
            ],
          )
        ],
      ),
    );
  }

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

  Row buildNameAndEmailFieldsDesktop() {
    return Row(
      children: [
        Flexible(
          child: CustomTextField(
            hintText: "Your Name",
            controller: _nameController,
          ),
        ),
        SizedBox(width: 15),
        Flexible(
          child: CustomTextField(
            hintText: "Your Email",
            controller: _emailController,
          ),
        ),
      ],
    );
  }

  Column buildNameAndEmailFieldsMobile() {
    return Column(
      children: [
        Flexible(
          child: CustomTextField(
            hintText: "Your Name",
            controller: _nameController,
          ),
        ),
        SizedBox(height: 15),
        Flexible(
          child: CustomTextField(
            hintText: "Your Email",
            controller: _emailController,
          ),
        ),
      ],
    );
  }
}
