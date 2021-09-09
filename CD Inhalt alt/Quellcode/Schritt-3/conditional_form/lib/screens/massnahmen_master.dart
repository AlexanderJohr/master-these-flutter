import 'package:conditional_form/choices/choices.dart';
import 'package:conditional_form/data_model/massnahme.dart';
import 'package:conditional_form/data_model/storage.dart';
import 'package:conditional_form/widgets/app_state.dart';
import 'package:conditional_form/widgets/massnahmen_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'massnahmen_detail/massnahmen_detail.dart';

final createNewMassnahmeButtonKey = GlobalKey();

class MassnahmenMasterScreen extends StatelessWidget {
  static const routeName = '/massnahmen_master';

  const MassnahmenMasterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = AppState.of(context).model;
    final vm = AppState.of(context).viewModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Maßnahmen Master'),
      ),
      body: StreamBuilder<Storage>(
          stream: model.storage,
          builder: (context, _) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Abgeschlossen",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: MassnahmenTable(
                            model.storage.value.massnahmen
                                .where((m) =>
                                    m.letzteBearbeitung.letzterStatus ==
                                    LetzterStatus.fertig.abbreviation)
                                .toSet(), onSelect: (selectedMassnahme) {
                          vm.model = selectedMassnahme.rebuild((m) => m
                            ..letzteBearbeitung.letztesBearbeitungsDatum =
                                DateTime.now().toUtc());

                          Navigator.of(context)
                              .pushNamed(MassnahmenDetailScreen.routeName);
                        }),
                      )),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "In Bearbeitung",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: MassnahmenTable(
                            model.storage.value.massnahmen
                                .where((m) =>
                                    m.letzteBearbeitung.letzterStatus ==
                                    LetzterStatus.bearb.abbreviation)
                                .toSet(), onSelect: (selectedMassnahme) {
                          vm.model = selectedMassnahme.rebuild((m) => m
                            ..letzteBearbeitung.letztesBearbeitungsDatum =
                                DateTime.now().toUtc());

                          Navigator.of(context)
                              .pushNamed(MassnahmenDetailScreen.routeName);
                        }),
                      )),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          key: createNewMassnahmeButtonKey,
          child: const Icon(
            Icons.post_add_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            vm.model = Massnahme();
            Navigator.of(context).pushNamed(MassnahmenDetailScreen.routeName);
          }),
    );
  }
}
