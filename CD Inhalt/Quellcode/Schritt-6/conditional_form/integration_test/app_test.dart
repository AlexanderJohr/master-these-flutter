import 'package:conditional_form/choices/base/choice.dart';
import 'package:conditional_form/choices/choices.dart';
import 'package:conditional_form/data_access/massnahmen_model.dart';
import 'package:conditional_form/persistence/massnahmen_json_file.dart';
import 'package:conditional_form/screens/massnahmen_detail/massnahmen_detail.dart';
import 'package:conditional_form/screens/massnahmen_detail/massnahmen_form_view_model.dart';
import 'package:conditional_form/screens/massnahmen_master.dart';
import 'package:conditional_form/widgets/app_state.dart';
import 'package:conditional_form/widgets/selection_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'app_test.mocks.dart';

const durationAfterEachStep = Duration(milliseconds: 1);

@GenerateMocks([MassnahmenJsonFile])
void main() {
  testWidgets('Can fill the form and save the correct json', (tester) async {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
        as IntegrationTestWidgetsFlutterBinding;
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    final massnahmenJsonFileMock = MockMassnahmenJsonFile();
    when(massnahmenJsonFileMock.readMassnahmen()).thenAnswer((_) async => {});

    await tester.pumpWidget(AppState(
        model: MassnahmenModel(massnahmenJsonFileMock),
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
        )));

    Future<void> tabSelectionCard(Choices choices) async {
      final Finder textLabel = find.text(choices.name);
      expect(textLabel, findsWidgets);

      final card = find.ancestor(of: textLabel, matching: find.byType(Card));
      expect(card, findsOneWidget);

      await tester.ensureVisible(card);
      await tester.tap(card);
      await tester.pumpAndSettle(durationAfterEachStep);
    }

    Future<void> tabConfirmButton() async {
      var confirmChoiceButton = find.byTooltip(confirmButtonTooltip);
      await tester.tap(confirmChoiceButton);
      await tester.pumpAndSettle(durationAfterEachStep);
    }

    Future<void> tabOption(Choice choice, {bool tabConfirm = false}) async {
      final choiceLabel = find.text(choice.description);
      expect(choiceLabel, findsOneWidget);

      await tester.ensureVisible(choiceLabel);
      await tester.tap(choiceLabel);
      await tester.pumpAndSettle(durationAfterEachStep);

      if (tabConfirm) {
        await tabConfirmButton();
      }
    }

    Future<void> fillTextFormField(
        {required String title, required String text}) async {
      final textFormField = find
          .ancestor(of: find.text(title), matching: find.byType(TextFormField))
          .first;
      expect(textFormField, findsOneWidget);

      await tester.ensureVisible(textFormField);
      await tester.enterText(textFormField, text);
      await tester.pumpAndSettle(durationAfterEachStep);
    }

    await tester.pumpAndSettle(durationAfterEachStep);

    var createNewMassnahmeButton = find.byKey(createNewMassnahmeButtonKey);
    await tester.tap(createNewMassnahmeButton);
    await tester.pumpAndSettle(durationAfterEachStep);

    await tabSelectionCard(letzterStatusChoices);
    await tabOption(LetzterStatus.fertig, tabConfirm: true);

    final now = DateTime.now();
    var massnahmeTitle =
        "Test Maßnahmen ${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}";
    await fillTextFormField(title: "Maßnahmentitel", text: massnahmeTitle);

    await tabSelectionCard(foerderklasseChoices);
    await tabOption(FoerderklasseChoice.aukm_ohne_vns, tabConfirm: true);

    await tabSelectionCard(kategorieChoices);
    await tabOption(KategorieChoice.extens, tabConfirm: true);

    await tabSelectionCard(zielflaecheChoices);
    await tabOption(ZielflaecheChoice.al, tabConfirm: true);

    await tabSelectionCard(zieleinheitChoices);
    await tabOption(ZieleinheitChoice.ha, tabConfirm: true);

    await tabSelectionCard(hauptzielsetzungLandChoices);
    await tabOption(ZielsetzungLandChoice.biodiv, tabConfirm: true);

    await tabSelectionCard(nebenzielsetzungLandChoices);
    await tabOption(ZielsetzungLandChoice.bsch);
    await tabOption(ZielsetzungLandChoice.klima, tabConfirm: true);

    var saveMassnahmeButton = find.byTooltip(saveMassnahmeTooltip);
    await tester.tap(saveMassnahmeButton);
    await tester.pumpAndSettle(durationAfterEachStep);

    var capturedJson =
        verify(massnahmenJsonFileMock.saveMassnahmen(captureAny)).captured.last;

    var actualMassnahme = capturedJson['massnahmen'][0] as Map;
    actualMassnahme.remove("guid");
    actualMassnahme["letzteBearbeitung"].remove("letztesBearbeitungsDatum");

    var expectedJson = {
      'letzteBearbeitung': {'letzterStatus': 'fertig'},
      'identifikatoren': {'massnahmenTitel': massnahmeTitle},
      'massnahmenCharakteristika': {
        'nebenziele': [
          'bsch',
          'klima',
        ],
        'foerderklasse': 'aukm_ohne_vns',
        'kategorie': 'extens',
        'zielflaeche': 'al',
        'zieleinheit': 'ha',
        'hauptzielsetzungLand': 'biodiv'
      },
    };

    expect(actualMassnahme, equals(expectedJson));
  });
}
