import 'package:folio/app/app_enums.dart';

import '../app/app_typedefs.dart';
import 'table_manager.dart';

class AppRepository {
  final TableManager _tableManager;

  const AppRepository(this._tableManager);

  Future<StringMap> loadLocalizations(String languageCode) => _tableManager
      .load(table: AppTable.localizations, columns: ['key', languageCode])
      .then((rows) => Map.fromEntries(rows.map((values) => MapEntry(values[0], values[1]))))
      .onError((_, __) => {});
}
