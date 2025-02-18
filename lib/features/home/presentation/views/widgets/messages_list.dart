import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/data/models/save_chat_model.dart';
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
  final SavedChatModel? savedChats;
}

class _MessagesListWidgetState extends State<MessagesListWidget> {
  late final ScrollController _controller;
  List<Message> localMessages = [];

  @override
  void initState() {
    super.initState();
    if (widget.savedChats != null) {
      localMessages.addAll(widget.savedChats!.messages);
      BlocProvider.of<SendMessageCubit>(context).messages.addAll(localMessages);
    }
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void upDateMethod(MessageSentSuccess state) {
    setState(() {
      localMessages = state.messages;
    });
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (_controller.hasClients) {
          _controller.animateTo(
            _controller.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendMessageCubit, SendMessageState>(
      listener: (BuildContext context, state) {
        if (state is MessageSentSuccess) {
          upDateMethod(state);
        }
      },
      child: Expanded(
        child: ListView.builder(
          controller: _controller,
          itemCount: localMessages.length,
          itemBuilder: (context, index) {
            return ChatMessageWidget(
              message: localMessages[index],
            );
          },
        ),
      ),
    );
  }
}
