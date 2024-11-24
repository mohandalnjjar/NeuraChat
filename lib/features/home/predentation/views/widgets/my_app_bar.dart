import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:neura_chat/core/constants/app_images.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/home/predentation/managers/get_messages_bloc/get_messages_bloc.dart';
import 'package:neura_chat/generated/l10n.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(FeatherIcons.menu),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              S.of(context).Neura,
              style: AppStyles.styleSemiBold24(context),
            ),
            Lottie.asset(
              height: 60,
              Assets.imagesLottieYaHabibi,
            ),
          ],
        ),
        actions: [
          BlocBuilder<GetMessagesBloc, GetMessagesState>(
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
          )
        ],
      ),
    );
  }
}
