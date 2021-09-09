import 'package:conditional_form/data_model/massnahme.dart';
import 'package:conditional_form/data_model/storage.dart';
import 'package:conditional_form/data_model/serializers.dart';
import 'package:conditional_form/persistence/massnahmen_json_file.dart';
import 'package:rxdart/rxdart.dart';

class MassnahmenModel {
  final MassnahmenJsonFile jsonFile;
  final storage = BehaviorSubject<Storage>.seeded(Storage());

  MassnahmenModel(this.jsonFile) {
    init();
  }

  init() async {
    try {
      final massnahmenAsJson = await jsonFile.readMassnahmen();

      storage.value =
          serializers.deserializeWith(Storage.serializer, massnahmenAsJson)!;
    } on MassnahmenFileDoesNotExistException {}
  }

  putMassnahmeIfAbsent(Massnahme massnahme) async {
    storage.value = storage.value.rebuild((b) => b.massnahmen
      ..removeWhere((m) => m.guid == massnahme.guid)
      ..add(massnahme));

    var serializedMassnahmen =
        serializers.serializeWith(Storage.serializer, storage.value);

    await jsonFile.saveMassnahmen(serializedMassnahmen as Map<String, dynamic>);
  }
}
