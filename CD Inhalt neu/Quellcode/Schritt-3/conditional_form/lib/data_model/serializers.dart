import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:conditional_form/data_model/massnahme.dart';

import 'storage.dart';

part 'serializers.g.dart';

@SerializersFor([Massnahme, Storage])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
