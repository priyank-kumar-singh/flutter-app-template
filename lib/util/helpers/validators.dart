class ValidationHelper {
  ValidationHelper._();

  static const _emailPattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const _requiredFieldText = 'This is a required field';

  static String? email(String? value) {
    return requiredField(value) ?? (RegExp(_emailPattern).hasMatch(value!) ? null : 'Invalid Email');
  }

  static String? name(String? value) {
    return requiredField(value) ?? (value!.contains(RegExp(r'[0-9]')) ? 'Numbers not allowed' : null);
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return _requiredFieldText;
    }
    if (value.length < 8) {
      return 'Password should be atleast of 8 characters';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password should contain atleast one number';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password should contain atleast one capital letter';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password should contain atleast one small letter';
    }
    return null;
  }

  static String? requiredField(String? text) {
    return (text == null || text.isEmpty) ? _requiredFieldText : null;
  }
}
