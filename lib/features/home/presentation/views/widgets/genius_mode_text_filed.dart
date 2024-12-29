import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_palette.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/core/utils/genius_mode_enum.dart';
import 'package:neura_chat/features/home/presentation/managers/get_genius_mode_instructions_bloc/get_genius_mode_instructions_bloc.dart';

class GeniusModeTextFiled extends StatefulWidget {
  const GeniusModeTextFiled({
    super.key,
    required this.title,
    required this.geniusMode,
  });

  final String title;
  final GeniusMode geniusMode;

  @override
  State<GeniusModeTextFiled> createState() => _GeniusModeTextFiledState();
}

class _GeniusModeTextFiledState extends State<GeniusModeTextFiled> {
  String? instruction;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.title,
          style: AppStyles.styleSemiBold18(context),
        ),
        GestureDetector(
          onTap: () => GoRouter.of(context).push(
            AppRoutes.kDetailsGeniusModeView,
            extra: {
              "title": widget.title,
              "geniusMode": widget.geniusMode,
              "bloc": context.read<GetGeniusModeInstructionsBloc>(),
              "instruction": instruction,
            },
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 17),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: BlocConsumer<GetGeniusModeInstructionsBloc,
                GetGeniusModeInstructionsState>(
              listener: (context, state) {
                if (state is GetGeniusModeInstructionsSuccess) {
                  final key = widget.geniusMode == GeniusMode.userInfo
                      ? 'geniusModeUserInfoKey'
                      : 'geniusModeInstructionsKey';
                  setState(
                    () {
                      instruction = state.instructions[key];
                    },
                  );
                }
              },
              builder: (context, state) {
                if (state is GetGeniusModeInstructionsLoading) {
                  return const Center(
                    child: SizedBox(
                      height: 5,
                    ),
                  );
                } else if (state is GetGeniusModeInstructionsSuccess) {
                  final key = widget.geniusMode == GeniusMode.userInfo
                      ? 'geniusModeUserInfoKey'
                      : 'geniusModeInstructionsKey';
                  final instruction = state.instructions[key] ?? 'Tap to add';
                  if (instruction.isEmpty || instruction == 'Tap to add') {
                    return Text(
                      'Tap to add',
                      style: AppStyles.styleRegular18(context).copyWith(
                        color: AppPalette.kPrimaryColor,
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    );
                  } else {
                    return Text(
                      instruction,
                      style: AppStyles.styleRegular18(context),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    );
                  }
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
