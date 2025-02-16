import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/utils/widgets/alert_pop_up.dart';
import 'package:neura_chat/core/utils/widgets/my_icon_button.dart';
import 'package:neura_chat/features/auth/presentatiion/managers/check_auth_state_bloc/check_auth_state_bloc.dart';
import 'package:neura_chat/features/home/presentation/managers/save_chat_bloc/save_chat_bloc.dart';
import 'package:neura_chat/features/home/presentation/managers/send_message_cubit/send_message_cubit.dart';
import 'package:neura_chat/features/home/presentation/managers/send_message_cubit/send_message_cubit_state.dart';

class SaveChatButton extends StatelessWidget {
  const SaveChatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckAuthStateBloc, CheckAuthStateState>(
      builder: (context, state) {
        if (state is Authenticated && !state.isanonymous) {
          return BlocBuilder<SendMessageCubit, SendMessageState>(
            builder: (context, state) {
              final sendMessageCubit = context.read<SendMessageCubit>();
              if (sendMessageCubit.messages.isNotEmpty) {
                return BlocConsumer<SaveChatBloc, SaveChatState>(
                  listener: (context, state) {
                    if (state is SaveChatSucess) {
                      popUpAlert(context: context, message: 'Saved Success');
                      Navigator.of(context).pop();
                    }
                    if (state is SaveChatFailed) {
                      popUpAlert(
                          context: context,
                          message:
                              'Some thing wrong. check internet and try again');
                    }
                  },
                  builder: (context, state) {
                    if (state is SaveChatLoading) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return MyIconButton(
                        icon: const Icon(Icons.bookmark_outline_rounded),
                        onPressed: () {
                          BlocProvider.of<SaveChatBloc>(context).add(
                            PerformSaveChatEvent(
                                messages: sendMessageCubit.messages),
                          );
                        },
                      );
                    }
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
