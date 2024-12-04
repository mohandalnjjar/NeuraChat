import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/features/home/presentation/managers/get_messages_bloc/get_messages_bloc.dart';

class ClearChatBlocButton extends StatelessWidget {
  const ClearChatBlocButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMessagesBloc, GetMessagesState>(
      builder: (context, state) {
        if (state is GetMessagesInitial) {
          return IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.edit,
            ),
            color: Colors.grey,
          );
        } else {
          return IconButton(
            onPressed: () {
              GoRouter.of(context).pushReplacement(AppRoutes.kChatView);
            },
            icon: const Icon(
              FeatherIcons.edit,
            ),
          );
        }
      },
    );
  }
}
