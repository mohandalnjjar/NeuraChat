import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/utils/widgets/alert_pop_up.dart';
import 'package:neura_chat/features/home/data/models/save_chat_model.dart';
import 'package:neura_chat/features/home/presentation/managers/delet_saved_chat_cubit/delet_saved_chat_cubit.dart';
import 'package:neura_chat/features/home/presentation/managers/fetch_saved_chats_bloc/fetch_saved_chats_bloc.dart';

class DeletMessageBlocButton extends StatelessWidget {
  const DeletMessageBlocButton({
    super.key,
    required this.savedChatModel,
  });

  final SavedChatModel savedChatModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeletSavedChatCubit, DeletSavedChatState>(
      builder: (context, state) {
        if (state is DeletSavedChatLoading) {
          return const SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(),
          );
        } else {
          return IconButton(
            onPressed: () {
              BlocProvider.of<DeletSavedChatCubit>(context)
                  .deletMethod(savedChatModel.chatId);
            },
            icon: const Icon(
              Icons.clear,
            ),
          );
        }
      },
      listener: (BuildContext context, state) {
        if (state is DeletSavedChatSuccess) {
          popUpAlert(context: context, message: 'Deleted');
          BlocProvider.of<FetchSavedChatsBloc>(context).add(
            FetchIntialSavedChatsEvent(),
          );
        }
        if (state is DeletSavedChatFailed) {
          popUpAlert(context: context, message: 'Check your network');
        }
      },
    );
  }
}
