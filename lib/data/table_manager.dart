import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:folio/app/app_enums.dart';

class TableManager {
  const TableManager();

  Future<List<List<String>>> load({required AppTable table, required List<String> columns}) => rootBundle
      .loadString('assets/tables/table_${table.id}.json')
      .then((jsonString) => parseJsonString(jsonString))
      .then((rows) => whereColumns(rows, columns))
      .onError((error, _) => _handleError(table, error));

  List<List<String>> parseJsonString(String jsonString) {
    final parsedJson = jsonDecode(jsonString) as List<dynamic>;
    return parsedJson.map((item) => List<String>.from(item)).toList();
  }

  List<List<String>> whereColumns(List<List<String>> rows, List<String> columns) {
    final indexes = rows[0]
        .asMap()
        .entries
        .where((entry) => columns.contains(entry.value))
        .map((entry) => entry.key)
        .toList(growable: false);

    return rows
        .sublist(1)
        .map((values) => List.generate(indexes.length, (index) => values[indexes[index]]))
        .toList(growable: false);
  }

  List<List<String>> _handleError(AppTable table, Object? error) {
    debugPrint('Read table $table error: $error');
    throw 'Read table error';
  }
}
