import 'package:example_form_app/validation.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String label;
  final FormFieldValidator<String>? validator;

  const Input({required this.label, this.validator});

  @override
  Widget build(BuildContext context) => TextFormField(
      decoration: InputDecoration(labelText: label),
      validator: validator ?? (value) => validateNotEmpty(label, value));
}