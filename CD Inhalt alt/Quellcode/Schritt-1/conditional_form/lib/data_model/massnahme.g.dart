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

class _$Massnahme extends Massnahme {
  @override
  final String guid;
  @override
  final LetzteBearbeitung letzteBearbeitung;
  @override
  final Identifikatoren identifikatoren;

  factory _$Massnahme([void Function(MassnahmeBuilder)? updates]) =>
      (new MassnahmeBuilder()..update(updates)).build();

  _$Massnahme._(
      {required this.guid,
      required this.letzteBearbeitung,
      required this.identifikatoren})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(guid, 'Massnahme', 'guid');
    BuiltValueNullFieldError.checkNotNull(
        letzteBearbeitung, 'Massnahme', 'letzteBearbeitung');
    BuiltValueNullFieldError.checkNotNull(
        identifikatoren, 'Massnahme', 'identifikatoren');
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
        identifikatoren == other.identifikatoren;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, guid.hashCode), letzteBearbeitung.hashCode),
        identifikatoren.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Massnahme')
          ..add('guid', guid)
          ..add('letzteBearbeitung', letzteBearbeitung)
          ..add('identifikatoren', identifikatoren))
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

  MassnahmeBuilder() {
    Massnahme._initializeBuilder(this);
  }

  MassnahmeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _guid = $v.guid;
      _letzteBearbeitung = $v.letzteBearbeitung.toBuilder();
      _identifikatoren = $v.identifikatoren.toBuilder();
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
              identifikatoren: identifikatoren.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'letzteBearbeitung';
        letzteBearbeitung.build();
        _$failedField = 'identifikatoren';
        identifikatoren.build();
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
