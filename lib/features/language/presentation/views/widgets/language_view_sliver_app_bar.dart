import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/core/utils/widgets/alert_pop_up.dart';
import 'package:neura_chat/core/utils/widgets/my_button.dart';
import 'package:neura_chat/features/language/presentation/managers/language_cubit/language_cubit.dart';
import 'package:neura_chat/generated/l10n.dart';

class LanguageViewSliverAppBar extends StatelessWidget {
  const LanguageViewSliverAppBar({
    super.key,
    required this.selectedLanguage,
  });

  final String selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      sliver: SliverAppBar(
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: Text(
          S.of(context).language,
          style: AppStyles.styleSemiBold27(context),
        ),
        actions: [
          CustomButton(
            icon: const Icon(
              FeatherIcons.check,
              color: Colors.white,
            ),
            onTap: () {
              if (BlocProvider.of<LanguageCubit>(context).currentLanguage ==
                  selectedLanguage) {
                alertPopUp(
                  context: context,
                  message: S.of(context).alreadyUsed,
                );
              } else {
                BlocProvider.of<LanguageCubit>(context).changeAppLanguage(
                  langValue: selectedLanguage,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
