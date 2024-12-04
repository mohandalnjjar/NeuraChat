import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:iconly/iconly.dart';
import 'package:neura_chat/core/constants/text_styles.dart';

class SavedMessageWidget extends StatelessWidget {
  const SavedMessageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xfffaf6cf).withOpacity(0.1),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(5),
            child: Icon(
              IconlyLight.message,
            ),
          ),
          Expanded(
            child: Text(
              "The Ultimate Neura",
              style: AppStyles.styleRegular18(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                FeatherIcons.moreHorizontal,
              ),
            ),
          )
        ],
      ),
    );
  }
}
