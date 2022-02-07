import 'package:conditional_form/choices/base/choice.dart';
import 'package:conditional_form/choices/choices.dart';
import 'package:conditional_form/widgets/app_state.dart';
import 'package:conditional_form/widgets/selection_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

const saveMassnahmeTooltip = "Validiere und speichere Massnahme";

class MassnahmenDetailScreen extends StatelessWidget {
  static const routeName = '/massnahmen-detail';

  const MassnahmenDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = AppState.of(context).viewModel;
    final model = AppState.of(context).model;
    final formKey = GlobalKey<FormState>();

    void saveDraftAndGoBackToOverviewScreen() {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
            const SnackBar(content: Text('Entwurf wird gespeichert ...')));

      var draft = vm.model.rebuild((b) =>
          b.letzteBearbeitung.letzterStatus = LetzterStatus.bearb.abbreviation);

      model.putMassnahmeIfAbsent(draft);
      Navigator.of(context).pop();
    }

    void saveRecord() {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
            const SnackBar(content: Text('Massnahme wird gespeichert ...')));

      model.putMassnahmeIfAbsent(vm.model);
    }

    void showValidationError() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
        children: [
          Text(
              'Fehler im Formular trotz Status "${LetzterStatus.fertig.description}"'),
          const SizedBox(width: 4),
          ElevatedButton(
            onPressed: saveDraftAndGoBackToOverviewScreen,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 8, 4),
              child: Row(
                children: const [
                  Icon(Icons.paste, color: Colors.white),
                  SizedBox(width: 4),
                  Text(
                    "Entwurf speichern?",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      )));
    }

    bool inputsAreValidOrNotMarkedFinal() {
      if (vm.letzterStatus.value != LetzterStatus.fertig) {
        return true;
      }

      if (formKey.currentState!.validate()) {
        return true;
      }

      return false;
    }

    Widget createMassnahmenTitelTextFormField() {
      final focusNode = FocusNode();
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            focusNode: focusNode,
            initialValue: vm.massnahmenTitel.value,
            decoration: const InputDecoration(
                hintText: 'Maßnahmentitel', labelText: 'Maßnahmentitel'),
            validator: (title) {
              if (title == null || title.isEmpty) {
                focusNode.requestFocus();
                return 'Bitte Text eingeben';
              }
              var massnahmeTitleDoesAlreadyExists =
                  model.storage.value.massnahmen.any((m) =>
                      m.guid != vm.guid.value &&
                      m.identifikatoren.massnahmenTitel ==
                          vm.massnahmenTitel.value);

              if (massnahmeTitleDoesAlreadyExists) {
                focusNode.requestFocus();
                return 'Dieser Maßnahmentitel ist bereits vergeben';
              }
              return null;
            },
            onChanged: (value) {
              vm.massnahmenTitel.value = value;
            },
          ),
        ),
      );
    }

    Widget buildSelectionCard<ChoiceType extends Choice>(
        {required Choices<ChoiceType> allChoices,
        required BehaviorSubject<ChoiceType?> selectionViewModel}) {
      return FormField(
          validator: (_) {
            Iterable<Choice> choices = {
              if (selectionViewModel.value != null) selectionViewModel.value!
            };

            if (choices.isEmpty) {
              return "Feld ${allChoices.name} enthält keinen Wert!";
            }

            return null;
          },
          builder: (field) => SelectionCard<ChoiceType>(
                title: allChoices.name,
                allChoices: allChoices,
                initialValue: {
                  if (selectionViewModel.value != null)
                    selectionViewModel.value!
                },
                onSelect: (selectedChoice) =>
                    selectionViewModel.value = selectedChoice,
                onDeselect: (selectedChoice) => selectionViewModel.value = null,
                errorText: field.errorText,
              ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Maßnahmen Detail'),
      ),
      body: WillPopScope(
        onWillPop: () {
          if (inputsAreValidOrNotMarkedFinal()) {
            saveRecord();
            return Future.value(true);
          } else {
            showValidationError();
            return Future.value(false);
          }
        },
        child: Form(
          key: formKey,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildSelectionCard(
                            allChoices: letzterStatusChoices,
                            selectionViewModel: vm.letzterStatus),
                        buildSectionHeadline("Identifikatoren"),
                        createMassnahmenTitelTextFormField(),
                        buildSectionHeadline("Maßnahmencharakteristika"),
                        buildSelectionCard(
                            allChoices: foerderklasseChoices,
                            selectionViewModel: vm.foerderklasse),
                        buildSelectionCard(
                            allChoices: kategorieChoices,
                            selectionViewModel: vm.kategorie),
                        buildSubSectionHeadline("Zielsetzung"),
                        buildSelectionCard(
                            allChoices: zielflaecheChoices,
                            selectionViewModel: vm.zielflaeche),
                        buildSelectionCard(
                            allChoices: zieleinheitChoices,
                            selectionViewModel: vm.zieleinheit),
                        buildSelectionCard(
                            allChoices: hauptzielsetzungLandChoices,
                            selectionViewModel: vm.hauptzielsetzungLand),
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
                        mini: true,
                        heroTag: 'save_draft_floating_action_button',
                        child: const Icon(Icons.paste, color: Colors.white),
                        backgroundColor: Colors.orange,
                        onPressed: saveDraftAndGoBackToOverviewScreen,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FloatingActionButton(
                        tooltip: saveMassnahmeTooltip,
                        heroTag: 'save_floating_action_button',
                        child: const Icon(Icons.check, color: Colors.white),
                        onPressed: () {
                          if (inputsAreValidOrNotMarkedFinal()) {
                            saveRecord();
                            Navigator.of(context).pop();
                          } else {
                            showValidationError();
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildSectionHeadline(String text) => Padding(
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 8),
      child: Text(text, style: const TextStyle(fontSize: 22)),
    );

Widget buildSubSectionHeadline(String text) => Padding(
      padding: const EdgeInsets.fromLTRB(4, 12, 0, 4),
      child: Text(text, style: const TextStyle(fontSize: 14)),
    );
