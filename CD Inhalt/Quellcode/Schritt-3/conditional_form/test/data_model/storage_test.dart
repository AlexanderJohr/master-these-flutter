import 'package:conditional_form/data_model/massnahme.dart';
import 'package:conditional_form/data_model/serializers.dart';
import 'package:conditional_form/data_model/storage.dart';
import 'package:test/test.dart';

void main() {
  test('Storage with one Massnahme serialises without error', () {
    var storage = Storage();
    storage = storage.rebuild((b) => b.massnahmen.add(
        Massnahme((b) => b.identifikatoren.massnahmenTitel = "Massnahme 1")));

    var actualJson = serializers.serializeWith(Storage.serializer, storage);

    var expectedJson = {
      "massnahmen": [
        {
          "guid": storage.massnahmen.first.guid,
          "letzteBearbeitung": {
            "letztesBearbeitungsDatum": storage
                .massnahmen
                .first
                .letzteBearbeitung
                .letztesBearbeitungsDatum
                .microsecondsSinceEpoch,
            "letzterStatus": "bearb"
          },
          "identifikatoren": {"massnahmenTitel": "Massnahme 1"}
        }
      ]
    };
    expect(actualJson, equals(expectedJson));

    // example:
    // {
    //   "massnahmen": [
    //     {
    //       "guid": "d6324b2e-1f56-456c-b128-b5c31ee8084d",
    //       "letzteBearbeitung": {
    //         "letztesBearbeitungsDatum": 1625854393558628,
    //         "letzterStatus": "bearb"
    //       },
    //       "identifikatoren": {"massnahmenTitel": ""}
    //     }
    //   ]
    // }
  });

  test('Storage with one Massnahme deserialises without error', () {
    var json = {
      "massnahmen": [
        {
          "guid": "test massnahme id",
          "letzteBearbeitung": {
            "letztesBearbeitungsDatum": 0,
            "letzterStatus": "bearb"
          },
          "identifikatoren": {"massnahmenTitel": "Massnahme 1"}
        }
      ]
    };

    var expectedStorage = Storage();
    expectedStorage =
        expectedStorage.rebuild((b) => b.massnahmen.add(Massnahme((b) => b
          ..guid = "test massnahme id"
          ..identifikatoren.massnahmenTitel = "Massnahme 1"
          ..letzteBearbeitung.update((b) {
            b.letztesBearbeitungsDatum =
                DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
          }))));

    var actualStorage = serializers.deserializeWith(Storage.serializer, json);

    expect(actualStorage, equals(expectedStorage));
  });
}
