import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/utils/genius_mode_enum.dart';
import 'package:neura_chat/features/home/presentation/managers/update_user_data_bloc/update_user_data_bloc.dart';

class GeniusModeSaveBlocButton extends StatelessWidget {
  const GeniusModeSaveBlocButton({
    super.key,
    required this.isContentChanged,
    required this.controller,
    required this.geniusMode,
  });

  final bool isContentChanged;
  final TextEditingController controller;
  final GeniusMode geniusMode;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserDataBloc, UpdateUserDataState>(
      listener: (BuildContext context, UpdateUserDataState state) {
        if (state is UpdateUserDataSuccess) {
          return context.pop();
        }
      },
      builder: (context, state) {
        if (state is UpdateUserDataLoading) {
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
                final event = geniusMode == GeniusMode.userInfo
                    ? PerfromUpdateUserDataEvent(
                        userInstuctions: controller.text)
                    : PerfromUpdateUserDataEvent(responseMode: controller.text);

                BlocProvider.of<UpdateUserDataBloc>(context).add(event);
              },
              child: const Text("save"),
            ),
          );
        }
      },
    );
  }
}
