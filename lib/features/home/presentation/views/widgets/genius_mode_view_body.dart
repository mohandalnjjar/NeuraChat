import 'package:flutter/material.dart';
import 'package:neura_chat/core/constants/app_padding.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/core/utils/genius_mode_enum.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/genius_mode_text_filed.dart';

class GeniusModeViewBody extends StatelessWidget {
  const GeniusModeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.globalPadding,
      child: ListView(
        children: [
          const GeniusModeTextFiled(
            title:
                "What would you like NEURA to know about you to provide better responses?",
            geniusMode: GeniusMode.userInfo,
          ),
          const GeniusModeTextFiled(
            title: "How Would You Like NEURA to respond?",
            geniusMode: GeniusMode.instructions,
          ),
          Text(
            "* Custom instructions will be applied to all new chats.",
            style: AppStyles.styleGreyReg16(context),
          ),
        ],
      ),
    );
  }
}
