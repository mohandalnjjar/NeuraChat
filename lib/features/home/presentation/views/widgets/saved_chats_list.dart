import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/features/home/presentation/managers/fetch_saved_chats_bloc/fetch_saved_chats_bloc.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/saved_chat_widget.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class SavedChatsList extends StatelessWidget {
  const SavedChatsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final RefreshController controllerRefresh =
        RefreshController(initialRefresh: false);

    return BlocConsumer<FetchSavedChatsBloc, FetchSavedChatsState>(
      listener: (BuildContext context, state) {},
      builder: (context, state) {
        if (state is FetchSavedChatsSuccess) {
          return SmartRefresher(
            header: const MaterialClassicHeader(
              color: Colors.black,
            ),
            controller: controllerRefresh,
            onRefresh: () {
              context
                  .read<FetchSavedChatsBloc>()
                  .add(FetchIntialSavedChatsEvent());
            },
            onLoading: () {
              final lastMessage = state.savedChats.last;
              context.read<FetchSavedChatsBloc>().add(
                    FetchSavedMoreChatsEvent(lastMessagel: lastMessage),
                  );
            },
            enablePullUp: true,
            child: ListView.builder(
              itemCount: state.savedChats.length,
              itemBuilder: (BuildContext context, int index) {
                return SavedChatWidget(
                  savedChatModel: state.savedChats[index],
                );
              },
            ),
          );
        } else if (state is FetchSavedChatsFailed) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
