import 'package:flutter_test/flutter_test.dart';
import 'package:folio/data/table_manager.dart';

void main() {
  group('', () {
    test('parsing JSON string', () {
      const tableManager = TableManager();
      const input = '[["key", "en"],["first_name", "Alexander"],["last_name", "Elpern"]]';
      const expected = [
        ["key", "en"],
        ["first_name", "Alexander"],
        ["last_name", "Elpern"]
      ];
      final actual = tableManager.parseJsonString(input);
      expect(actual, equals(expected));
    });
  });

  test('map table specific columns only', () {
    const tableManager = TableManager();

    const input = [
      ["key", "en"],
      ["first_name", "Alexander"],
      ["last_name", "Elpern"]
    ];

    const List<({List<String> columns, List<List<String>> expected})> experiments = [
      (
        columns: ["key", "en"],
        expected: [
          ["first_name", "Alexander"],
          ["last_name", "Elpern"],
        ],
      ),
      (
        columns: ["key"],
        expected: [
          ["first_name"],
          ["last_name"],
        ],
      ),
      (
        columns: ["en"],
        expected: [
          ["Alexander"],
          ["Elpern"],
        ],
      ),
      (
        columns: [],
        expected: [[], []],
      ),
    ];

    for (final experiment in experiments) {
      final actual = tableManager.whereColumns(input, experiment.columns);
      expect(actual, equals(experiment.expected), reason: 'expected: ${experiment.expected}, actual: $actual');
    }
  });
}
