import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/constants/app_images.dart';
import 'package:neura_chat/features/home/presentation/managers/fetch_saved_chats_bloc/fetch_saved_chats_bloc.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/saved_chat_widget.dart';

class SavedChatsList extends StatelessWidget {
  const SavedChatsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchSavedChatsBloc, FetchSavedChatsState>(
      listener: (BuildContext context, state) {},
      builder: (context, state) {
        if (state is FetchSavedChatsSuccess) {
          if (state.savedChats.isEmpty) {
            return const Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Image(
                    image: AssetImage(
                      Assets.imagesEmptyInbox,
                    ),
                  ),
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: state.savedChats.length,
              itemBuilder: (BuildContext context, int index) {
                return SavedChatWidget(
                  savedChatModel: state.savedChats[index],
                );
              },
            );
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
