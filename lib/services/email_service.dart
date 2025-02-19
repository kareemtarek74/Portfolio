import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class EmailResult {
  final bool success;
  final String? errorMessage;

  EmailResult({required this.success, this.errorMessage});
}

class EmailService {
  String get _serviceId => dotenv.env['EMAIL_SERVICE_ID'] ?? '';
  String get _templateId => dotenv.env['EMAIL_TEMPLATE_ID'] ?? '';
  String get _userId => dotenv.env['EMAIL_USER_ID'] ?? '';

  final String _apiUrl = 'https://api.emailjs.com/api/v1.0/email/send';

  Future<EmailResult> sendContactEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    try {
      if (_serviceId.isEmpty || _templateId.isEmpty || _userId.isEmpty) {
        return EmailResult(
            success: false,
            errorMessage: "Email service is not properly configured.");
      }

      final sanitizedName = _sanitizeInput(name);
      final sanitizedMessage = _sanitizeInput(message);

      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Origin': dotenv.env['APP_DOMAIN'] ?? 'https://yourportfolio.com',
        },
        body: json.encode({
          'service_id': _serviceId,
          'template_id': _templateId,
          'user_id': _userId,
          'template_params': {
            'name': sanitizedName,
            'email': email,
            'message': sanitizedMessage,
            'timestamp': DateTime.now().toString(),
          }
        }),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return EmailResult(success: true);
      } else {
        print('Error sending email: ${response.statusCode}');
        return EmailResult(
            success: false,
            errorMessage: "Failed to send email. Please try again later.");
      }
    } catch (e) {
      print('Exception sending email: $e');
      return EmailResult(
          success: false,
          errorMessage:
              "Connection error. Please check your internet connection.");
    }
  }

  String _sanitizeInput(String input) {
    final sanitized = input
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#39;');

    return sanitized;
  }
}
