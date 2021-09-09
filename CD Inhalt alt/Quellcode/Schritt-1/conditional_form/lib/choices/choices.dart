// ignore_for_file: non_constant_identifier_names

import 'base/choice.dart';

class LetzterStatus extends Choice {
  static final bearb = LetzterStatus("bearb", "in Bearbeitung");
  static final fertig = LetzterStatus("fertig", "abgeschlossen");

  LetzterStatus(String abbreviation, String description)
      : super(abbreviation, description);
}

final letzterStatusChoices = Choices<LetzterStatus>(
    {LetzterStatus.bearb, LetzterStatus.fertig},
    name: "Status");
