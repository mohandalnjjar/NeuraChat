import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/services/internet_connectivity.dart';
import 'package:neura_chat/core/utils/service_locator.dart';
import 'package:neura_chat/features/home/data/models/save_chat_model.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';
import 'package:neura_chat/features/home/presentation/managers/save_chat_bloc/save_chat_bloc.dart';
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
          create: (context) => SaveChatBloc(
            homeRepo: getIt.get<HomeRepoImpl>(),
            internetConnectivity: getIt.get<InternetConnectivity>(),
          ),
        ),
      ],
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: ChatViewAppBar(
            
            chatId: savedChats?.chatId,
          ),
        ),
        body: ChatViewBody(
          initialValue: initialValue,
          savedChats: savedChats,
        ),
      ),
    );
  }
}
