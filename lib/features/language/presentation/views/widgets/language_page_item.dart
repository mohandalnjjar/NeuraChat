import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/data/models/category_model.dart';

class LanguagePageItem extends StatelessWidget {
  const LanguagePageItem({
    super.key,
    required this.categoryItmeModel,
    required this.isActive,
  });
  final LanguageCategoryItemModel categoryItmeModel;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: AppColors.kWhitePrimaryColor,
        border: isActive
            ? Border.all(
                color: AppColors.kPrimaryColor,
                width: 2.0,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                categoryItmeModel.image,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            categoryItmeModel.title,
            style: AppStyles.styleRegular18(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
