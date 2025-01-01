import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return const SizedBox();
        } else {
          return Row(
            children: [
              IconButton(
                onPressed: () => GoRouter.of(context).pushReplacement(
                  AppRoutes.kChatView,
                  extra: {
                    'savedChats': null,
                    'initialValue': null,
                  },
                ),
                icon: const CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
