import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:conditional_form/choices/choices.dart';
import 'package:uuid/uuid.dart';

part 'massnahme.g.dart';

abstract class Massnahme implements Built<Massnahme, MassnahmeBuilder> {
  String get guid;

  LetzteBearbeitung get letzteBearbeitung;

  Identifikatoren get identifikatoren;

  static void _initializeBuilder(MassnahmeBuilder b) =>
      b..guid = const Uuid().v4();

  Massnahme._();

  factory Massnahme([void Function(MassnahmeBuilder) updates]) = _$Massnahme;

  static Serializer<Massnahme> get serializer => _$massnahmeSerializer;
}

abstract class Identifikatoren
    implements Built<Identifikatoren, IdentifikatorenBuilder> {
  String get massnahmenTitel;

  static void _initializeBuilder(IdentifikatorenBuilder b) =>
      b..massnahmenTitel = "";

  Identifikatoren._();

  factory Identifikatoren([void Function(IdentifikatorenBuilder) updates]) =
      _$Identifikatoren;

  static Serializer<Identifikatoren> get serializer =>
      _$identifikatorenSerializer;
}

abstract class LetzteBearbeitung
    implements Built<LetzteBearbeitung, LetzteBearbeitungBuilder> {
  DateTime get letztesBearbeitungsDatum;

  String get formattedDate {
    final date = letztesBearbeitungsDatum;
    return "${date.year}-${date.month}-${date.day} ${date.hour}:${date.minute}";
  }

  String get letzterStatus;

  static void _initializeBuilder(LetzteBearbeitungBuilder b) => b
    ..letztesBearbeitungsDatum = DateTime.now().toUtc()
    ..letzterStatus = LetzterStatus.bearb.abbreviation;

  LetzteBearbeitung._();

  factory LetzteBearbeitung([void Function(LetzteBearbeitungBuilder) updates]) =
      _$LetzteBearbeitung;

  static Serializer<LetzteBearbeitung> get serializer =>
      _$letzteBearbeitungSerializer;
}
