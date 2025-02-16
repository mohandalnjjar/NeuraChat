import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:neura_chat/core/constants/app_padding.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/presentation/managers/send_message_cubit/send_message_cubit.dart';
import 'package:neura_chat/features/home/presentation/managers/send_message_cubit/send_message_cubit_state.dart';

class SendMessageAgainWidget extends StatelessWidget {
  const SendMessageAgainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendMessageCubit, SendMessageState>(
      builder: (context, state) {
        if (state is MessageSentFailure) {
          return Container(
            margin: AppPadding.globalPadding,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(
                  FeatherIcons.info,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    'Hhh... something seems to have gone wrong.',
                    style: AppStyles.styleRegular16(context)
                        .copyWith(color: Colors.red),
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                IconButton(
                  onPressed: () {
                    context.read<SendMessageCubit>().sendMessage(
                          message: Message(
                            isUser: true,
                            content: state.lastMessage!.content,
                          ),
                        );
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
