import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/constants/app_palette.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/language/data/model/language_category_model.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem({
    super.key,
    required this.categoryItmeModel,
    required this.isActive,
  });
  final LanguageCategoryModel categoryItmeModel;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeCubitState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: BlocProvider.of<ThemeCubit>(context).getThemeMode
                ? AppPalette.kSecondaryDarkColor
                : AppPalette.kLightScaffoldColor,
            border: isActive
                ? Border.all(
                    color: AppPalette.kPrimaryColor,
                    width: 2.0,
                  )
                : null,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  categoryItmeModel.image,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                categoryItmeModel.title,
                style: AppStyles.styleRegular18(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Text(
                '(${categoryItmeModel.langOriginalName})',
                style: AppStyles.styleRegular15(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        );
      },
    );
  }
}
