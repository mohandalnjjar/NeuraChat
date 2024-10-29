class LanguageCategoryModel {
  final String title;
  final String langShort;
  final String langOriginalName;
  final String image;

  const LanguageCategoryModel({
    required this.langOriginalName,
    required this.image,
    required this.title,
    required this.langShort,
  });
}
