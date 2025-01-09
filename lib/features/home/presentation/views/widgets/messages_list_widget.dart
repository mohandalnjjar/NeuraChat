import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/presentation/managers/send_message_cubit/send_message_cubit.dart';
import 'package:neura_chat/features/home/presentation/managers/send_message_cubit/send_message_cubit_state.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/chat_message_widget.dart';

class MessagesListWidget extends StatefulWidget {
  const MessagesListWidget({
    super.key,
    this.savedChats,
  });

  @override
  State<MessagesListWidget> createState() => _MessagesListWidgetState();
  final List<Message>? savedChats;
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
    return BlocBuilder<SendMessageCubit, SendMessageState>(
      builder: (context, state) {
        if (state is MessageSentSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_controller.hasClients) {
              _controller.animateTo(
                _controller.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          });
          return Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: state.messages.length,
              itemBuilder: (context, index) {
                return ChatMessageWidget(
                  message: state.messages[index],
                );
              },
            ),
          );
        } else {
          return const Spacer();
        }
      },
    );
  }
}
