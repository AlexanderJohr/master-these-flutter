final emailPattern = RegExp(
    r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

String? validateEmail(String label, String? value) {
  if (value == null || value.isEmpty) {
    return '$label is required';
  } else if (!emailPattern.hasMatch(value)) {
    return 'Invalid Email Format';
  } else {
    return null;
  }
}

String? validateNotEmpty(String label, String? value) {
  if (value == null || value.isEmpty) {
    return '$label is required';
  } else {
    return null;
  }
}
