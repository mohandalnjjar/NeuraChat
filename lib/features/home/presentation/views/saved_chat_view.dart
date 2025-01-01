import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/utils/service_locator.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';
import 'package:neura_chat/features/home/presentation/managers/fetch_saved_chats_bloc/fetch_saved_chats_bloc.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/genius_mode_view_app_bar.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/saved_chats_view_body.dart';

class SavedChatView extends StatelessWidget {
  const SavedChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchSavedChatsBloc(
        getIt.get<HomeRepoImpl>(),
      )..add(
          PerformFetchSavedChatsEvent(),
        ),
      child: const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: MyAppBar(
            title: 'Chats',
          ),
        ),
        body: SafeArea(
          child: SavedChatsViewBody(),
        ),
      ),
    );
  }
}
