// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Storage> _$storageSerializer = new _$StorageSerializer();

class _$StorageSerializer implements StructuredSerializer<Storage> {
  @override
  final Iterable<Type> types = const [Storage, _$Storage];
  @override
  final String wireName = 'Storage';

  @override
  Iterable<Object?> serialize(Serializers serializers, Storage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'massnahmen',
      serializers.serialize(object.massnahmen,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(Massnahme)])),
    ];

    return result;
  }

  @override
  Storage deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StorageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'massnahmen':
          result.massnahmen.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltSet, const [const FullType(Massnahme)]))!
              as BuiltSet<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Storage extends Storage {
  @override
  final BuiltSet<Massnahme> massnahmen;

  factory _$Storage([void Function(StorageBuilder)? updates]) =>
      (new StorageBuilder()..update(updates)).build();

  _$Storage._({required this.massnahmen}) : super._() {
    BuiltValueNullFieldError.checkNotNull(massnahmen, 'Storage', 'massnahmen');
  }

  @override
  Storage rebuild(void Function(StorageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StorageBuilder toBuilder() => new StorageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Storage && massnahmen == other.massnahmen;
  }

  @override
  int get hashCode {
    return $jf($jc(0, massnahmen.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Storage')
          ..add('massnahmen', massnahmen))
        .toString();
  }
}

class StorageBuilder implements Builder<Storage, StorageBuilder> {
  _$Storage? _$v;

  SetBuilder<Massnahme>? _massnahmen;
  SetBuilder<Massnahme> get massnahmen =>
      _$this._massnahmen ??= new SetBuilder<Massnahme>();
  set massnahmen(SetBuilder<Massnahme>? massnahmen) =>
      _$this._massnahmen = massnahmen;

  StorageBuilder();

  StorageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _massnahmen = $v.massnahmen.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Storage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Storage;
  }

  @override
  void update(void Function(StorageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Storage build() {
    _$Storage _$result;
    try {
      _$result = _$v ?? new _$Storage._(massnahmen: massnahmen.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'massnahmen';
        massnahmen.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Storage', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
