// Mocks generated by Mockito 5.0.10 from annotations
// in conditional_form/integration_test/app_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:conditional_form/persistence/massnahmen_json_file.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [MassnahmenJsonFile].
///
/// See the documentation for Mockito's code generation for more information.
class MockMassnahmenJsonFile extends _i1.Mock
    implements _i2.MassnahmenJsonFile {
  MockMassnahmenJsonFile() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> saveMassnahmen(Map<String, dynamic>? massnahmenAsJson) =>
      (super.noSuchMethod(
          Invocation.method(#saveMassnahmen, [massnahmenAsJson]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i3.Future<void>);
  @override
  _i3.Future<Map<String, dynamic>> readMassnahmen() => (super.noSuchMethod(
          Invocation.method(#readMassnahmen, []),
          returnValue: Future<Map<String, dynamic>>.value(<String, dynamic>{}))
      as _i3.Future<Map<String, dynamic>>);
}
