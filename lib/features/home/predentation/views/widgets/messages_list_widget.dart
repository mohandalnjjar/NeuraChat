import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/features/home/predentation/managers/get_messages_bloc/get_messages_bloc.dart';
import 'package:neura_chat/features/home/predentation/views/widgets/chat_message_widget.dart';

class MessagesListWidget extends StatelessWidget {
  const MessagesListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMessagesBloc, GetMessagesState>(
      builder: (context, state) {
        if (state is GetMessagesSuccess) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.messagesList.length,
              itemBuilder: (context, index) =>
                  ChatMessageWidget(message: state.messagesList[index]),
            ),
          );
        } else {
          return const Center(
            child: Text(
              'Any Neura any thing',
            ),
          );
        }
      },
    );
  }
}
