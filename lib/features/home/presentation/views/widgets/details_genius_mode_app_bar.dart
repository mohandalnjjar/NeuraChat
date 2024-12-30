import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/utils/genius_mode_enum.dart';
import 'package:neura_chat/core/utils/widgets/my_icon_button.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/genius_mode_save_bloc_button.dart';

class DetailsGeniusModeAppBar extends StatelessWidget {
  const DetailsGeniusModeAppBar({
    super.key,
    required this.isContentChanged,
    required this.controller,
    required this.geniusMode,
  });

  final bool isContentChanged;
  final TextEditingController controller;
  final GeniusMode geniusMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: MyIconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () => context.pop(),
        ),
        actions: [
          GeniusModeSaveBlocButton(
            isContentChanged: isContentChanged,
            controller: controller,
            geniusMode: geniusMode,
          )
        ],
      ),
    );
  }
}
