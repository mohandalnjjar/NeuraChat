import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/utils/service_locator.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';
import 'package:neura_chat/features/home/presentation/managers/get_messages_bloc/get_messages_bloc.dart';
import 'package:neura_chat/features/home/presentation/managers/send_message_cubit/send_message_cubit.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/chat_view_body.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/chat_view_my_app_bar.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key, this.initialValue, this.savedChats});
  final String? initialValue;

  final SavedChatModel? savedChats;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SendMessageCubit(
            homeRepoImpl: getIt.get<HomeRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => GetMessagesBloc(
            homeRepoImpl: getIt.get<HomeRepoImpl>(),
          ),
        ),
      ],
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: ChatViewAppBar(),
        ),
        body: ChatViewBody(
          initialValue: initialValue,
          savedChats: savedChats,
        ),
      ),
    );
  }
}
