import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'massnahme.dart';

part 'storage.g.dart';

abstract class Storage implements Built<Storage, StorageBuilder> {
  BuiltSet<Massnahme> get massnahmen;

  Storage._();

  factory Storage([void Function(StorageBuilder) updates]) = _$Storage;

  static Serializer<Storage> get serializer => _$storageSerializer;
}
