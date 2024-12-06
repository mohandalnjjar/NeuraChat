import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';
import 'package:neura_chat/features/home/presentation/managers/get_messages_bloc/get_messages_bloc.dart';
import 'package:neura_chat/features/home/presentation/managers/send_message_cubit/send_message_cubit.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/chat_view_body.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/my_app_bar.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key, this.initialValue});
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SendMessageCubit(
            homeRepoImpl: HomeRepoImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => GetMessagesBloc(
            homeRepoImpl: HomeRepoImpl(),
          ),
        ),
      ],
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MyAppBar(),
        ),
        body: ChatViewBody(
          initialValue: initialValue,
        ),
      ),
    );
  }
}
