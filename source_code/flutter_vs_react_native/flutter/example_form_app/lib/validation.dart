final emailPattern = new RegExp(
    r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

validateEmail(value) {
  if (value == null || !emailPattern.hasMatch(value))
    return 'Invalid Email Format';
  else
    return null;
}

validateNotEmpty(String label, value) {
  if (value == null || value.isEmpty)
    return '$label is required';
  else
    return null;
}
