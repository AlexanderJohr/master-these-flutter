import 'package:built_collection/built_collection.dart';
import 'package:conditional_form/choices/base/choice.dart';
import 'package:conditional_form/choices/choices.dart';
import 'package:conditional_form/data_model/massnahme.dart';
import 'package:rxdart/rxdart.dart';

class MassnahmenFormViewModel {
  final letzterStatus = BehaviorSubject<LetzterStatus?>.seeded(null);

  final guid = BehaviorSubject<String?>.seeded(null);

  final massnahmenTitel = BehaviorSubject<String>.seeded("");

  final foerderklasse = BehaviorSubject<FoerderklasseChoice?>.seeded(null);
  final kategorie = BehaviorSubject<KategorieChoice?>.seeded(null);
  final zielflaeche = BehaviorSubject<ZielflaecheChoice?>.seeded(null);
  final zieleinheit = BehaviorSubject<ZieleinheitChoice?>.seeded(null);
  final hauptzielsetzungLand =
      BehaviorSubject<ZielsetzungLandChoice?>.seeded(null);
  final nebenziele = BehaviorSubject<BuiltSet<ZielsetzungLandChoice>>.seeded(
      BuiltSet<ZielsetzungLandChoice>());

  BehaviorSubject<Set<Choice>> priorChoices =
      BehaviorSubject<Set<Choice>>.seeded({});

  MassnahmenFormViewModel() {
    Stream<Set<Choice>> choicesStream = Rx.combineLatest([
      foerderklasse,
      kategorie,
      zielflaeche,
      zieleinheit,
      hauptzielsetzungLand,
      nebenziele
    ], (_) {
      return {
        if (foerderklasse.value != null) foerderklasse.value!,
        if (kategorie.value != null) kategorie.value!,
        if (zielflaeche.value != null) zielflaeche.value!,
        if (zieleinheit.value != null) zieleinheit.value!,
        if (hauptzielsetzungLand.value != null) hauptzielsetzungLand.value!,
      };
    });

    choicesStream.listen((event) => priorChoices.add(event));
  }

  set model(Massnahme model) {
    guid.value = model.guid;

    letzterStatus.value = letzterStatusChoices
        .fromAbbreviation(model.letzteBearbeitung.letzterStatus);
    massnahmenTitel.value = model.identifikatoren.massnahmenTitel;

    {
      final mc = model.massnahmenCharakteristika;

      foerderklasse.value =
          foerderklasseChoices.fromAbbreviation(mc.foerderklasse);
      kategorie.value = kategorieChoices.fromAbbreviation(mc.kategorie);

      zielflaeche.value = zielflaecheChoices.fromAbbreviation(mc.zielflaeche);
      zieleinheit.value = zieleinheitChoices.fromAbbreviation(mc.zieleinheit);
      hauptzielsetzungLand.value =
          hauptzielsetzungLandChoices.fromAbbreviation(mc.hauptzielsetzungLand);
      nebenziele.value = BuiltSet(mc.nebenziele
          .map((n) => hauptzielsetzungLandChoices.fromAbbreviation(n)));
    }
  }

  Massnahme get model => Massnahme((b) => b
    ..guid = guid.value
    ..letzteBearbeitung.letzterStatus = letzterStatus.value?.abbreviation
    ..letzteBearbeitung.letztesBearbeitungsDatum = DateTime.now().toUtc()
    ..identifikatoren.update((b) => b..massnahmenTitel = massnahmenTitel.value)
    ..massnahmenCharakteristika.update((b) => b
      ..foerderklasse = foerderklasse.value?.abbreviation
      ..kategorie = kategorie.value?.abbreviation
      ..zielflaeche = zielflaeche.value?.abbreviation
      ..zieleinheit = zieleinheit.value?.abbreviation
      ..hauptzielsetzungLand = hauptzielsetzungLand.value?.abbreviation
      ..nebenziele =
          SetBuilder(nebenziele.value.map((n) => n.abbreviation).toList())));
}
