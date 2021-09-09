// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:conditional_form/persistence/massnahmen_json_file.dart';
import 'package:conditional_form/screens/massnahmen_detail/massnahmen_detail.dart';
import 'package:conditional_form/screens/massnahmen_detail/massnahmen_form_view_model.dart';
import 'package:conditional_form/screens/massnahmen_master.dart';
import 'package:conditional_form/widgets/app_state.dart';
import 'package:flutter/material.dart';

import 'data_access/massnahmen_model.dart';

void main() {
  runApp(const MassnahmenFormApp());
}

class MassnahmenFormApp extends StatelessWidget {
  const MassnahmenFormApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppState(
        model: MassnahmenModel(MassnahmenJsonFile()),
        viewModel: MassnahmenFormViewModel(),
    child: MaterialApp(
      title: 'Maßnahmen',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        accentColor: Colors.green,
        primaryIconTheme: const IconThemeData(color: Colors.white),
      ),
      initialRoute: MassnahmenMasterScreen.routeName,
      routes: {
        MassnahmenMasterScreen.routeName: (context) =>
        const MassnahmenMasterScreen(),
        MassnahmenDetailScreen.routeName: (context) =>
        const MassnahmenDetailScreen()
      },
    ));
  }
}
