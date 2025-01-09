import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/core/utils/widgets/my_icon_button.dart';

class MoreChatButton extends StatelessWidget {
  const MoreChatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyIconButton(
      icon: const Icon(EvaIcons.moreHorizontal),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return Stack(
              children: [
                Positioned(
                  top: 60,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        IconButton(
                          onPressed: () {},
                          icon: Text(
                            'Save',
                            style: AppStyles.styleRegular16(context),
                          ),
                        ),
                        const SizedBox(height: 8),
                        IconButton(
                          onPressed: () {},
                          icon: Text(
                            'New Chat',
                            style: AppStyles.styleRegular16(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
