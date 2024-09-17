enum AppLanguages {
  english(languageCode: 'en');

  final String languageCode;

  const AppLanguages({required this.languageCode});
}

enum AppTable {
  localizations(id: 1);

  final int id;

  const AppTable({required this.id});
}
