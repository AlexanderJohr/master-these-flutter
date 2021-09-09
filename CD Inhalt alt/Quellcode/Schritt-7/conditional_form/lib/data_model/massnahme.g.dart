// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'massnahme.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Massnahme> _$massnahmeSerializer = new _$MassnahmeSerializer();
Serializer<Identifikatoren> _$identifikatorenSerializer =
    new _$IdentifikatorenSerializer();
Serializer<LetzteBearbeitung> _$letzteBearbeitungSerializer =
    new _$LetzteBearbeitungSerializer();
Serializer<MassnahmenCharakteristika> _$massnahmenCharakteristikaSerializer =
    new _$MassnahmenCharakteristikaSerializer();

class _$MassnahmeSerializer implements StructuredSerializer<Massnahme> {
  @override
  final Iterable<Type> types = const [Massnahme, _$Massnahme];
  @override
  final String wireName = 'Massnahme';

  @override
  Iterable<Object?> serialize(Serializers serializers, Massnahme object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'guid',
      serializers.serialize(object.guid, specifiedType: const FullType(String)),
      'letzteBearbeitung',
      serializers.serialize(object.letzteBearbeitung,
          specifiedType: const FullType(LetzteBearbeitung)),
      'identifikatoren',
      serializers.serialize(object.identifikatoren,
          specifiedType: const FullType(Identifikatoren)),
      'massnahmenCharakteristika',
      serializers.serialize(object.massnahmenCharakteristika,
          specifiedType: const FullType(MassnahmenCharakteristika)),
    ];

    return result;
  }

  @override
  Massnahme deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MassnahmeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'guid':
          result.guid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'letzteBearbeitung':
          result.letzteBearbeitung.replace(serializers.deserialize(value,
                  specifiedType: const FullType(LetzteBearbeitung))!
              as LetzteBearbeitung);
          break;
        case 'identifikatoren':
          result.identifikatoren.replace(serializers.deserialize(value,
                  specifiedType: const FullType(Identifikatoren))!
              as Identifikatoren);
          break;
        case 'massnahmenCharakteristika':
          result.massnahmenCharakteristika.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(MassnahmenCharakteristika))!
              as MassnahmenCharakteristika);
          break;
      }
    }

    return result.build();
  }
}

class _$IdentifikatorenSerializer
    implements StructuredSerializer<Identifikatoren> {
  @override
  final Iterable<Type> types = const [Identifikatoren, _$Identifikatoren];
  @override
  final String wireName = 'Identifikatoren';

  @override
  Iterable<Object?> serialize(Serializers serializers, Identifikatoren object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'massnahmenTitel',
      serializers.serialize(object.massnahmenTitel,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Identifikatoren deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IdentifikatorenBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'massnahmenTitel':
          result.massnahmenTitel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LetzteBearbeitungSerializer
    implements StructuredSerializer<LetzteBearbeitung> {
  @override
  final Iterable<Type> types = const [LetzteBearbeitung, _$LetzteBearbeitung];
  @override
  final String wireName = 'LetzteBearbeitung';

  @override
  Iterable<Object?> serialize(Serializers serializers, LetzteBearbeitung object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'letztesBearbeitungsDatum',
      serializers.serialize(object.letztesBearbeitungsDatum,
          specifiedType: const FullType(DateTime)),
      'letzterStatus',
      serializers.serialize(object.letzterStatus,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  LetzteBearbeitung deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LetzteBearbeitungBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'letztesBearbeitungsDatum':
          result.letztesBearbeitungsDatum = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'letzterStatus':
          result.letzterStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MassnahmenCharakteristikaSerializer
    implements StructuredSerializer<MassnahmenCharakteristika> {
  @override
  final Iterable<Type> types = const [
    MassnahmenCharakteristika,
    _$MassnahmenCharakteristika
  ];
  @override
  final String wireName = 'MassnahmenCharakteristika';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, MassnahmenCharakteristika object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'nebenziele',
      serializers.serialize(object.nebenziele,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(String)])),
    ];
    Object? value;
    value = object.foerderklasse;
    if (value != null) {
      result
        ..add('foerderklasse')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.kategorie;
    if (value != null) {
      result
        ..add('kategorie')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.zielflaeche;
    if (value != null) {
      result
        ..add('zielflaeche')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.zieleinheit;
    if (value != null) {
      result
        ..add('zieleinheit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hauptzielsetzungLand;
    if (value != null) {
      result
        ..add('hauptzielsetzungLand')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  MassnahmenCharakteristika deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MassnahmenCharakteristikaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'foerderklasse':
          result.foerderklasse = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'kategorie':
          result.kategorie = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'zielflaeche':
          result.zielflaeche = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'zieleinheit':
          result.zieleinheit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hauptzielsetzungLand':
          result.hauptzielsetzungLand = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nebenziele':
          result.nebenziele.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))!
              as BuiltSet<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Massnahme extends Massnahme {
  @override
  final String guid;
  @override
  final LetzteBearbeitung letzteBearbeitung;
  @override
  final Identifikatoren identifikatoren;
  @override
  final MassnahmenCharakteristika massnahmenCharakteristika;

  factory _$Massnahme([void Function(MassnahmeBuilder)? updates]) =>
      (new MassnahmeBuilder()..update(updates)).build();

  _$Massnahme._(
      {required this.guid,
      required this.letzteBearbeitung,
      required this.identifikatoren,
      required this.massnahmenCharakteristika})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(guid, 'Massnahme', 'guid');
    BuiltValueNullFieldError.checkNotNull(
        letzteBearbeitung, 'Massnahme', 'letzteBearbeitung');
    BuiltValueNullFieldError.checkNotNull(
        identifikatoren, 'Massnahme', 'identifikatoren');
    BuiltValueNullFieldError.checkNotNull(
        massnahmenCharakteristika, 'Massnahme', 'massnahmenCharakteristika');
  }

  @override
  Massnahme rebuild(void Function(MassnahmeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MassnahmeBuilder toBuilder() => new MassnahmeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Massnahme &&
        guid == other.guid &&
        letzteBearbeitung == other.letzteBearbeitung &&
        identifikatoren == other.identifikatoren &&
        massnahmenCharakteristika == other.massnahmenCharakteristika;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, guid.hashCode), letzteBearbeitung.hashCode),
            identifikatoren.hashCode),
        massnahmenCharakteristika.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Massnahme')
          ..add('guid', guid)
          ..add('letzteBearbeitung', letzteBearbeitung)
          ..add('identifikatoren', identifikatoren)
          ..add('massnahmenCharakteristika', massnahmenCharakteristika))
        .toString();
  }
}

class MassnahmeBuilder implements Builder<Massnahme, MassnahmeBuilder> {
  _$Massnahme? _$v;

  String? _guid;
  String? get guid => _$this._guid;
  set guid(String? guid) => _$this._guid = guid;

  LetzteBearbeitungBuilder? _letzteBearbeitung;
  LetzteBearbeitungBuilder get letzteBearbeitung =>
      _$this._letzteBearbeitung ??= new LetzteBearbeitungBuilder();
  set letzteBearbeitung(LetzteBearbeitungBuilder? letzteBearbeitung) =>
      _$this._letzteBearbeitung = letzteBearbeitung;

  IdentifikatorenBuilder? _identifikatoren;
  IdentifikatorenBuilder get identifikatoren =>
      _$this._identifikatoren ??= new IdentifikatorenBuilder();
  set identifikatoren(IdentifikatorenBuilder? identifikatoren) =>
      _$this._identifikatoren = identifikatoren;

  MassnahmenCharakteristikaBuilder? _massnahmenCharakteristika;
  MassnahmenCharakteristikaBuilder get massnahmenCharakteristika =>
      _$this._massnahmenCharakteristika ??=
          new MassnahmenCharakteristikaBuilder();
  set massnahmenCharakteristika(
          MassnahmenCharakteristikaBuilder? massnahmenCharakteristika) =>
      _$this._massnahmenCharakteristika = massnahmenCharakteristika;

  MassnahmeBuilder() {
    Massnahme._initializeBuilder(this);
  }

  MassnahmeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _guid = $v.guid;
      _letzteBearbeitung = $v.letzteBearbeitung.toBuilder();
      _identifikatoren = $v.identifikatoren.toBuilder();
      _massnahmenCharakteristika = $v.massnahmenCharakteristika.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Massnahme other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Massnahme;
  }

  @override
  void update(void Function(MassnahmeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Massnahme build() {
    _$Massnahme _$result;
    try {
      _$result = _$v ??
          new _$Massnahme._(
              guid: BuiltValueNullFieldError.checkNotNull(
                  guid, 'Massnahme', 'guid'),
              letzteBearbeitung: letzteBearbeitung.build(),
              identifikatoren: identifikatoren.build(),
              massnahmenCharakteristika: massnahmenCharakteristika.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'letzteBearbeitung';
        letzteBearbeitung.build();
        _$failedField = 'identifikatoren';
        identifikatoren.build();
        _$failedField = 'massnahmenCharakteristika';
        massnahmenCharakteristika.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Massnahme', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Identifikatoren extends Identifikatoren {
  @override
  final String massnahmenTitel;

  factory _$Identifikatoren([void Function(IdentifikatorenBuilder)? updates]) =>
      (new IdentifikatorenBuilder()..update(updates)).build();

  _$Identifikatoren._({required this.massnahmenTitel}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        massnahmenTitel, 'Identifikatoren', 'massnahmenTitel');
  }

  @override
  Identifikatoren rebuild(void Function(IdentifikatorenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IdentifikatorenBuilder toBuilder() =>
      new IdentifikatorenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Identifikatoren && massnahmenTitel == other.massnahmenTitel;
  }

  @override
  int get hashCode {
    return $jf($jc(0, massnahmenTitel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Identifikatoren')
          ..add('massnahmenTitel', massnahmenTitel))
        .toString();
  }
}

class IdentifikatorenBuilder
    implements Builder<Identifikatoren, IdentifikatorenBuilder> {
  _$Identifikatoren? _$v;

  String? _massnahmenTitel;
  String? get massnahmenTitel => _$this._massnahmenTitel;
  set massnahmenTitel(String? massnahmenTitel) =>
      _$this._massnahmenTitel = massnahmenTitel;

  IdentifikatorenBuilder() {
    Identifikatoren._initializeBuilder(this);
  }

  IdentifikatorenBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _massnahmenTitel = $v.massnahmenTitel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Identifikatoren other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Identifikatoren;
  }

  @override
  void update(void Function(IdentifikatorenBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Identifikatoren build() {
    final _$result = _$v ??
        new _$Identifikatoren._(
            massnahmenTitel: BuiltValueNullFieldError.checkNotNull(
                massnahmenTitel, 'Identifikatoren', 'massnahmenTitel'));
    replace(_$result);
    return _$result;
  }
}

class _$LetzteBearbeitung extends LetzteBearbeitung {
  @override
  final DateTime letztesBearbeitungsDatum;
  @override
  final String letzterStatus;

  factory _$LetzteBearbeitung(
          [void Function(LetzteBearbeitungBuilder)? updates]) =>
      (new LetzteBearbeitungBuilder()..update(updates)).build();

  _$LetzteBearbeitung._(
      {required this.letztesBearbeitungsDatum, required this.letzterStatus})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(letztesBearbeitungsDatum,
        'LetzteBearbeitung', 'letztesBearbeitungsDatum');
    BuiltValueNullFieldError.checkNotNull(
        letzterStatus, 'LetzteBearbeitung', 'letzterStatus');
  }

  @override
  LetzteBearbeitung rebuild(void Function(LetzteBearbeitungBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LetzteBearbeitungBuilder toBuilder() =>
      new LetzteBearbeitungBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LetzteBearbeitung &&
        letztesBearbeitungsDatum == other.letztesBearbeitungsDatum &&
        letzterStatus == other.letzterStatus;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, letztesBearbeitungsDatum.hashCode), letzterStatus.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LetzteBearbeitung')
          ..add('letztesBearbeitungsDatum', letztesBearbeitungsDatum)
          ..add('letzterStatus', letzterStatus))
        .toString();
  }
}

class LetzteBearbeitungBuilder
    implements Builder<LetzteBearbeitung, LetzteBearbeitungBuilder> {
  _$LetzteBearbeitung? _$v;

  DateTime? _letztesBearbeitungsDatum;
  DateTime? get letztesBearbeitungsDatum => _$this._letztesBearbeitungsDatum;
  set letztesBearbeitungsDatum(DateTime? letztesBearbeitungsDatum) =>
      _$this._letztesBearbeitungsDatum = letztesBearbeitungsDatum;

  String? _letzterStatus;
  String? get letzterStatus => _$this._letzterStatus;
  set letzterStatus(String? letzterStatus) =>
      _$this._letzterStatus = letzterStatus;

  LetzteBearbeitungBuilder() {
    LetzteBearbeitung._initializeBuilder(this);
  }

  LetzteBearbeitungBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _letztesBearbeitungsDatum = $v.letztesBearbeitungsDatum;
      _letzterStatus = $v.letzterStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LetzteBearbeitung other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LetzteBearbeitung;
  }

  @override
  void update(void Function(LetzteBearbeitungBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LetzteBearbeitung build() {
    final _$result = _$v ??
        new _$LetzteBearbeitung._(
            letztesBearbeitungsDatum: BuiltValueNullFieldError.checkNotNull(
                letztesBearbeitungsDatum,
                'LetzteBearbeitung',
                'letztesBearbeitungsDatum'),
            letzterStatus: BuiltValueNullFieldError.checkNotNull(
                letzterStatus, 'LetzteBearbeitung', 'letzterStatus'));
    replace(_$result);
    return _$result;
  }
}

class _$MassnahmenCharakteristika extends MassnahmenCharakteristika {
  @override
  final String? foerderklasse;
  @override
  final String? kategorie;
  @override
  final String? zielflaeche;
  @override
  final String? zieleinheit;
  @override
  final String? hauptzielsetzungLand;
  @override
  final BuiltSet<String> nebenziele;

  factory _$MassnahmenCharakteristika(
          [void Function(MassnahmenCharakteristikaBuilder)? updates]) =>
      (new MassnahmenCharakteristikaBuilder()..update(updates)).build();

  _$MassnahmenCharakteristika._(
      {this.foerderklasse,
      this.kategorie,
      this.zielflaeche,
      this.zieleinheit,
      this.hauptzielsetzungLand,
      required this.nebenziele})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        nebenziele, 'MassnahmenCharakteristika', 'nebenziele');
  }

  @override
  MassnahmenCharakteristika rebuild(
          void Function(MassnahmenCharakteristikaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MassnahmenCharakteristikaBuilder toBuilder() =>
      new MassnahmenCharakteristikaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MassnahmenCharakteristika &&
        foerderklasse == other.foerderklasse &&
        kategorie == other.kategorie &&
        zielflaeche == other.zielflaeche &&
        zieleinheit == other.zieleinheit &&
        hauptzielsetzungLand == other.hauptzielsetzungLand &&
        nebenziele == other.nebenziele;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, foerderklasse.hashCode), kategorie.hashCode),
                    zielflaeche.hashCode),
                zieleinheit.hashCode),
            hauptzielsetzungLand.hashCode),
        nebenziele.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MassnahmenCharakteristika')
          ..add('foerderklasse', foerderklasse)
          ..add('kategorie', kategorie)
          ..add('zielflaeche', zielflaeche)
          ..add('zieleinheit', zieleinheit)
          ..add('hauptzielsetzungLand', hauptzielsetzungLand)
          ..add('nebenziele', nebenziele))
        .toString();
  }
}

class MassnahmenCharakteristikaBuilder
    implements
        Builder<MassnahmenCharakteristika, MassnahmenCharakteristikaBuilder> {
  _$MassnahmenCharakteristika? _$v;

  String? _foerderklasse;
  String? get foerderklasse => _$this._foerderklasse;
  set foerderklasse(String? foerderklasse) =>
      _$this._foerderklasse = foerderklasse;

  String? _kategorie;
  String? get kategorie => _$this._kategorie;
  set kategorie(String? kategorie) => _$this._kategorie = kategorie;

  String? _zielflaeche;
  String? get zielflaeche => _$this._zielflaeche;
  set zielflaeche(String? zielflaeche) => _$this._zielflaeche = zielflaeche;

  String? _zieleinheit;
  String? get zieleinheit => _$this._zieleinheit;
  set zieleinheit(String? zieleinheit) => _$this._zieleinheit = zieleinheit;

  String? _hauptzielsetzungLand;
  String? get hauptzielsetzungLand => _$this._hauptzielsetzungLand;
  set hauptzielsetzungLand(String? hauptzielsetzungLand) =>
      _$this._hauptzielsetzungLand = hauptzielsetzungLand;

  SetBuilder<String>? _nebenziele;
  SetBuilder<String> get nebenziele =>
      _$this._nebenziele ??= new SetBuilder<String>();
  set nebenziele(SetBuilder<String>? nebenziele) =>
      _$this._nebenziele = nebenziele;

  MassnahmenCharakteristikaBuilder();

  MassnahmenCharakteristikaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _foerderklasse = $v.foerderklasse;
      _kategorie = $v.kategorie;
      _zielflaeche = $v.zielflaeche;
      _zieleinheit = $v.zieleinheit;
      _hauptzielsetzungLand = $v.hauptzielsetzungLand;
      _nebenziele = $v.nebenziele.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MassnahmenCharakteristika other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MassnahmenCharakteristika;
  }

  @override
  void update(void Function(MassnahmenCharakteristikaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MassnahmenCharakteristika build() {
    _$MassnahmenCharakteristika _$result;
    try {
      _$result = _$v ??
          new _$MassnahmenCharakteristika._(
              foerderklasse: foerderklasse,
              kategorie: kategorie,
              zielflaeche: zielflaeche,
              zieleinheit: zieleinheit,
              hauptzielsetzungLand: hauptzielsetzungLand,
              nebenziele: nebenziele.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'nebenziele';
        nebenziele.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MassnahmenCharakteristika', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
