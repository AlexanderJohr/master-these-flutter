import 'package:conditional_form/choices/choices.dart';
import 'package:conditional_form/widgets/app_state.dart';
import 'package:conditional_form/widgets/selection_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const saveMassnahmeTooltip = "Validiere und speichere Massnahme";

class MassnahmenDetailScreen extends StatelessWidget {
  static const routeName = '/massnahmen-detail';

  const MassnahmenDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = AppState.of(context).viewModel;
    final model = AppState.of(context).model;

    Future<bool> saveRecord() {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
            const SnackBar(content: Text('Massnahme wird gespeichert ...')));

      model.putMassnahmeIfAbsent(vm.model);

      return Future.value(true);
    }

    Widget createMassnahmenTitelTextFormField() {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            initialValue: vm.massnahmenTitel.value,
            decoration: const InputDecoration(
                hintText: 'Maßnahmentitel', labelText: 'Maßnahmentitel'),
            onChanged: (value) {
              vm.massnahmenTitel.value = value;
            },
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Maßnahmen Detail'),
        ),
        body: WillPopScope(
          onWillPop: () => saveRecord(),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectionCard<LetzterStatus>(
                          title: letzterStatusChoices.name,
                          allChoices: letzterStatusChoices,
                          initialValue: {
                            if (vm.letzterStatus.value != null)
                              vm.letzterStatus.value!
                          },
                          onSelect: (selectedChoice) =>
                              vm.letzterStatus.value = selectedChoice,
                          onDeselect: (selectedChoice) =>
                              vm.letzterStatus.value = null,
                        ),
                        createMassnahmenTitelTextFormField(),
                        const SizedBox(height: 64)
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FloatingActionButton(
                        tooltip: saveMassnahmeTooltip,
                        heroTag: 'save_floating_action_button',
                        child: const Icon(Icons.check, color: Colors.white),
                        onPressed: () {
                          saveRecord();
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
