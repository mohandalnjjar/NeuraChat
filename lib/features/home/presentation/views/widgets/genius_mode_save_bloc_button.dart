import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/utils/genius_mode_enum.dart';
import 'package:neura_chat/core/utils/widgets/alert_pop_up.dart';
import 'package:neura_chat/features/home/presentation/managers/get_genius_mode_instructions_bloc/get_genius_mode_instructions_bloc.dart';
import 'package:neura_chat/features/home/presentation/managers/save_genius_mode_data_bloc/genius_mode_data_save_bloc.dart';

class GeniusModeSaveBlocButton extends StatelessWidget {
  const GeniusModeSaveBlocButton({
    super.key,
    required this.isContentChanged,
    required this.geniusMode,
    required this.controller,
  });

  final bool isContentChanged;
  final GeniusMode geniusMode;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeniusModeDataSaveBloc, GeniusModeSaveState>(
      listener: (context, state) {
        if (state is GeniusModeDataSaveSucces) {
          BlocProvider.of<GetGeniusModeInstructionsBloc>(context).add(
            PerformGetGeniusModeInstructionsEvent(),
          );
          context.pop();
        }
        if (state is GeniusModeDataSaveFailed) {
          popUpAlert(
            context: context,
            message: state.errorMessage,
          );
        }
      },
      builder: (context, state) {
        if (state is GeniusModeDataSaveLoading) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Visibility(
            visible: isContentChanged,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                BlocProvider.of<GeniusModeDataSaveBloc>(context).add(
                  PerformGeniusModeDataSaveEvent(
                    geniusMode: geniusMode,
                    instruction: controller.text,
                  ),
                );
              },
              child: const Text("save"),
            ),
          );
        }
      },
    );
  }
}
