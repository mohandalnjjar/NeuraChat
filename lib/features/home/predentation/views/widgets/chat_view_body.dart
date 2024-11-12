import 'package:flutter/material.dart';
import 'package:neura_chat/features/home/predentation/views/widgets/chat_message_widget.dart';
import 'package:neura_chat/features/home/predentation/views/widgets/custom_sliver_app_bar.dart';
import 'package:neura_chat/features/home/predentation/views/widgets/user_message_widget.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomSliverAppBar(),
        SliverToBoxAdapter(
          child: UserMessageWidget(),
        ),
        SliverToBoxAdapter(
          child: ChatMessageWidget(),
        ),
      ],
    );
  }
}
