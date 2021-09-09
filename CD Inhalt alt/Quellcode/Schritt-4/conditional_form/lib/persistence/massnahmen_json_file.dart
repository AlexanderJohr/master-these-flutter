import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class MassnahmenJsonFile {
  Future<File> get _localMassnahmenJsonFile async {
    var directory = await getApplicationSupportDirectory();
    return File("${directory.path}/Maßnahmen.json");
  }

  Future<void> saveMassnahmen(Map<String, dynamic> massnahmenAsJson) async {
    var file = await _localMassnahmenJsonFile;
    await file.writeAsString(jsonEncode(massnahmenAsJson));
  }

  Future<Map<String, dynamic>> readMassnahmen() async {
    var file = await _localMassnahmenJsonFile;

    var fileExists = await file.exists();
    if (fileExists) {
      final fileContent = await file.readAsString();
      final jsonObject = jsonDecode(fileContent) as Map<String, dynamic>;

      return jsonObject;
    } else {
      throw MassnahmenFileDoesNotExistException("$file was not found");
    }
  }
}

class MassnahmenFileDoesNotExistException implements Exception {
  String cause;

  MassnahmenFileDoesNotExistException(this.cause);
}
