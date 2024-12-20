import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_palette.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/core/utils/genius_mode_enum.dart';
import 'package:neura_chat/features/home/presentation/managers/get_genius_mode_instructions_bloc/get_genius_mode_instructions_bloc.dart';

class GeniusModeTextFiled extends StatelessWidget {
  const GeniusModeTextFiled({
    super.key,
    required this.title,
    required this.geniusMode,
  });

  final String title;
  final GeniusMode geniusMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: AppStyles.styleSemiBold18(context),
        ),
        GestureDetector(
          onTap: () => GoRouter.of(context).push(
            AppRoutes.kDetailsGeniusModeView,
            extra: {
              "title": title,
              "geniusMode": geniusMode,
            },
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 17),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: BlocBuilder<GetGeniusModeInstructionsBloc,
                GetGeniusModeInstructionsState>(
              builder: (context, state) {
                if (state is GetGeniusModeInstructionsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetGeniusModeInstructionsSuccess) {
                  final instruction =
                      state.instructions['geniusModeUserInfoKey'] ?? "Add New";

                  return Text(
                    instruction,
                    style: AppStyles.styleRegular18(context).copyWith(
                      color: AppPalette.kPrimaryColor,
                    ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  );
                } else if (state is GetGeniusModeInstructionsFailed) {
                  return Text(
                    "Error: ",
                    style: AppStyles.styleRegular18(context).copyWith(
                      color: Colors.red,
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
