import '../app/app_enums.dart';
import '../app/app_typedefs.dart';
import '../models/project_item.dart';
import 'table_manager.dart';

class AppRepository {
  final TableManager _tableManager;

  const AppRepository(this._tableManager);

  Future<StringMap> loadLocalizations(String languageCode) => _tableManager
      .load(table: AppTable.localizations, columns: ['key', languageCode])
      .then((rows) => Map.fromEntries(rows.map((values) => MapEntry(values[0], values[1]))))
      .onError((_, __) => {});

  Future<List<ProjectItem>> getProjects() => Future.value([
    ProjectItem(
        icon: 'assets/projects/dimri_residents_logo.png',
        titleKey: 'project_title_01',
        descriptionKey: 'project_description_01',
        githubLink: 'https://pub.dev/packages/awesome_snackbar_content'),
    ProjectItem(
        icon: 'assets/projects/my-pool_logo.png',
        titleKey: 'project_title_02',
        descriptionKey: 'project_description_02',
        githubLink: 'https://github.com/mhmzdev/The_Holy_Quran_App'),
    ProjectItem(
        icon: 'assets/projects/one_code_base_logo.png',
        titleKey: 'project_title_03',
        descriptionKey: 'project_description_03',
        githubLink: 'https://github.com/mhmzdev/MedKit-Pharmacy-App-Using-Flutter'),
    ProjectItem(
        icon: 'assets/projects/manpower_logo.png',
        titleKey: 'project_title_04',
        descriptionKey: 'project_description_04',
        githubLink: 'https://github.com/mhmzdev/Here-I-Am-Alert-App'),
    ProjectItem(
        icon: 'assets/projects/the_paths_of_memory_logo.png',
        titleKey: 'project_title_05',
        descriptionKey: 'project_description_05',
        githubLink: 'https://github.com/mhmzdev/Covid19-Tracker-App'),
    ProjectItem(
        icon: 'assets/projects/agriot_logo.png',
        titleKey: 'project_title_06',
        descriptionKey: 'project_description_06',
        githubLink: 'https://github.com/mhmzdev/Messenger-Chat-Head-Flutter-UI'),
    ProjectItem(
        icon: 'assets/projects/cian_logo.png',
        titleKey: 'project_title_07',
        descriptionKey: 'project_description_07',
        githubLink: 'https://github.com/mhmzdev/flutter.dev-Flutter-Web-Clone'),
    ProjectItem(
        icon: 'assets/projects/union_radio_one_logo.png',
        titleKey: 'project_title_08',
        descriptionKey: 'project_description_08',
        githubLink: 'https://github.com/mhmzdev/Earbender_Music_App'),
    ProjectItem(
        icon: 'assets/projects/devfolio_logo.png',
        titleKey: 'project_title_09',
        descriptionKey: 'project_description_09',
        githubLink: 'https://github.com/mhmzdev/Earbender_Music_App'),
  ]);
}
