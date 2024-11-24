import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/features/home/predentation/managers/get_messages_bloc/get_messages_bloc.dart';
import 'package:neura_chat/features/home/predentation/views/widgets/chat_message_widget.dart';
import 'package:neura_chat/features/home/predentation/views/widgets/welcom_widget.dart';

class MessagesListWidget extends StatefulWidget {
  const MessagesListWidget({
    super.key,
  });

  @override
  State<MessagesListWidget> createState() => _MessagesListWidgetState();
}

class _MessagesListWidgetState extends State<MessagesListWidget> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMessagesBloc, GetMessagesState>(
      builder: (context, state) {
        if (state is GetMessagesSuccess) {
          return Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: state.messagesList.length,
              itemBuilder: (context, index) {
                return ChatMessageWidget(
                  message: state.messagesList[index],
                );
              },
            ),
          );
        } else {
          return const WelcomWidget();
        }
      },
    );
  }
}
