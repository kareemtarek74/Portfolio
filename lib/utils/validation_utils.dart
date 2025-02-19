class ValidationUtils {
  static bool isValidEmail(String email) {
    if (email.trim().isEmpty) return false;

    final RegExp emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      caseSensitive: false,
      multiLine: false,
    );

    return emailRegex.hasMatch(email);
  }

  static bool hasMinimumLength(String text, int minLength) {
    return text.trim().length >= minLength;
  }

  static bool hasMaximumLength(String text, int maxLength) {
    return text.trim().length <= maxLength;
  }

  static bool containsNoSpecialChars(String text) {
    final RegExp allowedChars = RegExp(r'^[a-zA-Z0-9\s]+$');
    return allowedChars.hasMatch(text);
  }
}
