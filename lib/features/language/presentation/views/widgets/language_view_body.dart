import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/utils/widgets/alert_pop_up.dart';
import 'package:neura_chat/core/utils/widgets/laoding_indicator.dart';
import 'package:neura_chat/features/language/data/model/language_category_model.dart';
import 'package:neura_chat/features/language/data/model/language_data_model.dart';
import 'package:neura_chat/features/language/presentation/managers/language_cubit/language_cubit.dart';
import 'package:neura_chat/features/language/presentation/views/widgets/language_page_item.dart';
import 'package:neura_chat/features/language/presentation/views/widgets/language_view_sliver_app_bar.dart';
import 'package:neura_chat/generated/l10n.dart';

class LanguageViewBody extends StatefulWidget {
  const LanguageViewBody({
    super.key,
  });

  @override
  State<LanguageViewBody> createState() => _LanguageViewBodyState();
}

class _LanguageViewBodyState extends State<LanguageViewBody> {
  late String selectedLanguage;
  late List<LanguageCategoryModel> items;

  @override
  void initState() {
    selectedLanguage = BlocProvider.of<LanguageCubit>(context).currentLanguage;

    items = LanguageData.items;
    var selectedIndex =
        items.indexWhere((item) => item.langShort == selectedLanguage);
    var removedIndex = items.removeAt(selectedIndex);
    items.insert(0, removedIndex);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LanguageCubit, LanguageState>(
      listener: (context, state) {
        if (state is LanguageLoading) {
          const LoadingIndicator(inAsyncCall: true);
        } else if (state is LanguageChangeDone) {
          context.pop();
          alertPopUp(
              context: context, message: S.of(context).changedSuccessfully);
        } else {
          alertPopUp(
            context: context,
            message: S.of(context).tryAgain,
          );
        }
      },
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            LanguageViewSliverAppBar(selectedLanguage: selectedLanguage),
            SliverList.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  if (selectedLanguage != items[index].langShort) {
                    setState(
                      () {
                        selectedLanguage = items[index].langShort;
                        var selected = items.removeAt(index);
                        items.insert(0, selected);
                      },
                    );
                  }
                },
                child: SizedBox(
                  height: 89,
                  child: LanguagePageItem(
                    categoryItmeModel: items[index],
                    isActive: selectedLanguage == items[index].langShort,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
