import 'package:flutter/material.dart';
import 'package:neura_chat/features/saved_chats/presentation/views/widgets/saved_chats_view_body.dart';

class SavedChatView extends StatelessWidget {
  const SavedChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SavedChatsViewBody(),
      ),
    );
  }
}
