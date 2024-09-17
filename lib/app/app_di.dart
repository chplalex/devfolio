import 'package:folio/data/app_repository.dart';
import 'package:folio/data/table_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDI {
  static providesCommonModule() {
    GetIt.I.registerSingletonAsync(() => SharedPreferences.getInstance());
  }

  static providesDataModule() {
    GetIt.I.registerLazySingleton(() => const TableManager());
    GetIt.I.registerLazySingleton(() => AppRepository(GetIt.I.get()));
  }

  static Future<void> setupAsync() {
    return GetIt.I.getAsync<SharedPreferences>();
  }
}
