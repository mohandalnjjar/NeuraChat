import 'package:flutter/material.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/genius_mode_view_app_bar.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/saved_chats_view_body.dart';

class SavedChatView extends StatelessWidget {
  const SavedChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: MyAppBar(
          title: 'Chats',
        ),
      ),
      body: SafeArea(
        child: SavedChatsViewBody(),
      ),
    );
  }
}
