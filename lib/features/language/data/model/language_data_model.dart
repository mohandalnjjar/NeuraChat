import 'package:neura_chat/core/constants/app_images.dart';
import 'package:neura_chat/features/language/data/model/language_category_model.dart';

class LanguageData {
  static List<LanguageCategoryModel> get items {
    return [
      const LanguageCategoryModel(
        title: 'Arabic',
        image: Assets.imagesSaudiFlag,
        langShort: 'ar',
        langOriginalName: 'العربية',
      ),
      const LanguageCategoryModel(
        title: 'English',
        image: Assets.imagesUkFlag,
        langShort: 'en',
        langOriginalName: 'English',
      ),
      const LanguageCategoryModel(
        title: 'German',
        image: Assets.imagesGermanyFlag,
        langShort: 'de',
        langOriginalName: 'Deutsch',
      ),
    ];
  }
}
