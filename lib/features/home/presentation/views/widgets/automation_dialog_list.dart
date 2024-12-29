import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/constants/app_palette.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/automation_dialog_list_item.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';

class FastActionsDialogList extends StatelessWidget {
  const FastActionsDialogList({
    super.key,
    required this.fastActionsList,
  });

  final List<String> fastActionsList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ThemeCubit, ThemeCubitState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: BlocProvider.of<ThemeCubit>(context).getThemeMode
                  ? AppPalette.kDarkScaffoldColor
                  : AppPalette.kwhitModeMessageColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: fastActionsList.length,
                itemBuilder: (context, index) {
                  return AutomationDialogListItem(
                    prompt: fastActionsList[index],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
