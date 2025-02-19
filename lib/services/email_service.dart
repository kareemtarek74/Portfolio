import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class EmailResult {
  final bool success;
  final String? errorMessage;

  EmailResult({required this.success, this.errorMessage});
}

class EmailService {
  // استخدام flutter_dotenv لتخزين المعلومات الحساسة في ملف .env
  // ولن يتم تضمينه في نظام التحكم بالإصدار
  String get _serviceId => dotenv.env['EMAIL_SERVICE_ID'] ?? '';
  String get _templateId => dotenv.env['EMAIL_TEMPLATE_ID'] ?? '';
  String get _userId => dotenv.env['EMAIL_USER_ID'] ?? '';

  // معلومات API ثابتة
  final String _apiUrl = 'https://api.emailjs.com/api/v1.0/email/send';

  // إنشاء رمز مميز للجلسة لمنع هجمات إعادة التشغيل

  Future<EmailResult> sendContactEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    try {
      // تحقق من توفر مفاتيح API
      if (_serviceId.isEmpty || _templateId.isEmpty || _userId.isEmpty) {
        return EmailResult(
            success: false,
            errorMessage: "Email service is not properly configured.");
      }

      // توليد رمز مميز للجلسة

      // تنظيف وتصفية المدخلات
      final sanitizedName = _sanitizeInput(name);
      final sanitizedMessage = _sanitizeInput(message);

      // إنشاء الرسالة
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
        // تسجيل الخطأ بشكل آمن (يمكن إضافة منطق لتسجيل الأخطاء)
        print('Error sending email: ${response.statusCode}');
        return EmailResult(
            success: false,
            errorMessage: "Failed to send email. Please try again later.");
      }
    } catch (e) {
      // تسجيل الاستثناء بشكل آمن
      print('Exception sending email: $e');
      return EmailResult(
          success: false,
          errorMessage:
              "Connection error. Please check your internet connection.");
    }
  }

  // تصفية المدخلات لمنع هجمات الحقن
  String _sanitizeInput(String input) {
    // إزالة أي علامات HTML محتملة
    final sanitized = input
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#39;');

    return sanitized;
  }
}
