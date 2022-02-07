import 'package:conditional_form/choices/choices.dart';
import 'package:conditional_form/data_model/massnahme.dart';
import 'package:rxdart/rxdart.dart';

class MassnahmenFormViewModel {
  final letzterStatus = BehaviorSubject<LetzterStatus?>.seeded(null);

  final guid = BehaviorSubject<String?>.seeded(null);

  final massnahmenTitel = BehaviorSubject<String>.seeded("");

  set model(Massnahme model) {
    guid.value = model.guid;

    letzterStatus.value = letzterStatusChoices
        .fromAbbreviation(model.letzteBearbeitung.letzterStatus);
    massnahmenTitel.value = model.identifikatoren.massnahmenTitel;
  }

  Massnahme get model => Massnahme((b) => b
    ..guid = guid.value
    ..letzteBearbeitung.letzterStatus = letzterStatus.value?.abbreviation
    ..letzteBearbeitung.letztesBearbeitungsDatum = DateTime.now().toUtc()
    ..identifikatoren
        .update((b) => b..massnahmenTitel = massnahmenTitel.value));
}
