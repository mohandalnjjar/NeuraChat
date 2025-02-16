import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/utils/widgets/alert_pop_up.dart';
import 'package:neura_chat/core/utils/widgets/send_message_again_widget.dart';
import 'package:neura_chat/features/home/data/models/save_chat_model.dart';
import 'package:neura_chat/features/home/presentation/managers/save_chat_bloc/save_chat_bloc.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/messages_list.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/neura_loading_orb.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/send_message_widget.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({
    super.key,
    this.initialValue,
    this.savedChats,
  });

  final String? initialValue;
  final SavedChatModel? savedChats;

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SaveChatBloc, SaveChatState>(
      listener: (context, state) {
        if (state is SaveChatFailed) {
          popUpAlert(context: context, message: state.errorMessage);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MessagesListWidget(savedChats: widget.savedChats),
          const NeuraLoadingOrb(),
          const SendMessageAgainWidget(),
          SendMessageWidget(
            initialValue: widget.initialValue,
          )
        ],
      ),
    );
  }
}
