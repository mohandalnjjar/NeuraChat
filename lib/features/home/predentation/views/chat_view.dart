import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';
import 'package:neura_chat/features/home/predentation/managers/get_messages_bloc/get_messages_bloc.dart';
import 'package:neura_chat/features/home/predentation/managers/send_message_cubit/send_message_cubit.dart';
import 'package:neura_chat/features/home/predentation/views/widgets/app_drawer.dart';
import 'package:neura_chat/features/home/predentation/views/widgets/chat_view_body.dart';
import 'package:neura_chat/features/home/predentation/views/widgets/my_app_bar.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MessageCubit(
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
          preferredSize: Size.fromHeight(70),
          child: MyAppBar(),
        ),
        drawer: const AppDrawer(),
        body: const ChatViewBody(),
      ),
    );
  }
}
