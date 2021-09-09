import 'dart:convert';

import 'package:flutter/material.dart';
import 'validation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: MyForm(),
        ),
      );
}

class MyForm extends StatelessWidget {
  final formData = Map<String,String>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image(
                    image: AssetImage('assets/logo_flutter.png'), height: 100),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Form in Flutter", style: TextStyle(fontSize: 30)),
              ),
              TextFormField(
                  decoration: const InputDecoration(labelText: "Name"),
                  validator: (String? value) => validateNotEmpty("Name", value),
                  onChanged: (value) => formData["name"] = value),
              TextFormField(
                  decoration: const InputDecoration(labelText: "Email"),
                  validator: (String? value) => validateEmail("Name", value),
                  onChanged: (value) => formData["email"] = value),
              TextFormField(
                  decoration: const InputDecoration(labelText: "Password"),
                  validator: (String? value) =>
                      validateNotEmpty("Password", value),
                  onChanged: (value) => formData["password"] = value),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(jsonEncode(formData))));
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      );
}
