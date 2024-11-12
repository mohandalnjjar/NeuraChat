import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/home/predentation/views/widgets/chat_view_body.dart';
import 'package:neura_chat/features/home/predentation/views/widgets/send_message_widget.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';
import 'package:neura_chat/generated/l10n.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          child: BlocBuilder<ThemeCubit, ThemeCubitState>(
            builder: (context, state) {
              return SwitchListTile(
                contentPadding: const EdgeInsets.only(right: 10),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      BlocProvider.of<ThemeCubit>(context).themeMode
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      color: BlocProvider.of<ThemeCubit>(context).themeMode
                          ? Colors.white
                          : Colors.black,
                    ),
                    Text(
                      BlocProvider.of<ThemeCubit>(context).themeMode
                          ? "Dark mode"
                          : "light mode",
                      style: AppStyles.styleRegular18(context),
                    ),
                  ],
                ),
                value: BlocProvider.of<ThemeCubit>(context).themeMode,
                onChanged: (value) async {
                  await BlocProvider.of<ThemeCubit>(context)
                      .changAppTheme(themeValue: value);
                },
              );
            },
          ),
        ),
      ),
      body: const ChatViewBody(),
      bottomSheet: SendMessageWidget(
        onFieldSubmitted: (value) {},
        hintText: S.of(context).AskAnyQuestion,
        uploadButtom: GestureDetector(
          onTap: () {},
          child: const Icon(
            FeatherIcons.plus,
            size: 27,
          ),
        ),
      ),
    );
  }
}
