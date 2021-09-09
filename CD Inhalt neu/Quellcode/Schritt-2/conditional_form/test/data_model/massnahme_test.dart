import 'package:conditional_form/data_model/massnahme.dart';
import 'package:conditional_form/data_model/serializers.dart';
import 'package:test/test.dart';

void main() {
  test('Massnahme serialises without error', () {
    var massnahme = Massnahme();
    massnahme = massnahme
        .rebuild((b) => b.identifikatoren.massnahmenTitel = "Massnahme 1");

    var actualJson = serializers.serializeWith(Massnahme.serializer, massnahme);

    var expectedJson = {
      'guid': massnahme.guid,
      'letzteBearbeitung': {
        'letztesBearbeitungsDatum': massnahme
            .letzteBearbeitung.letztesBearbeitungsDatum.microsecondsSinceEpoch,
        'letzterStatus': 'bearb'
      },
      'identifikatoren': {'massnahmenTitel': 'Massnahme 1'}
    };

    expect(actualJson, equals(expectedJson));

    // example:
    // {
    //   'guid': '6123b3e1-738d-42a8-8c4d-d6415d86eefc',
    //   'letzteBearbeitung': {
    //     'letztesBearbeitungsDatum': 1625854964969847,
    //     'letzterStatus': 'bearb'
    //   },
    //   'identifikatoren': {'massnahmenTitel': 'Massnahme 1'}
    // }
  });

  test('Massnahme deserialises without error', () {
    var json = {
      'guid': "test massnahme id",
      'letzteBearbeitung': {
        'letztesBearbeitungsDatum': 0,
        'letzterStatus': 'bearb'
      },
      'identifikatoren': {'massnahmenTitel': 'Massnahme 1'}
    };

    var expectedMassnahme = Massnahme((b) => b
      ..guid = "test massnahme id"
      ..identifikatoren.massnahmenTitel = "Massnahme 1"
      ..letzteBearbeitung.update((b) {
        b.letztesBearbeitungsDatum =
            DateTime.fromMicrosecondsSinceEpoch(0, isUtc: true);
      }));
    var actualMassnahme =
        serializers.deserializeWith(Massnahme.serializer, json);

    expect(actualMassnahme, equals(expectedMassnahme));
  });
}
