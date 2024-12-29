import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_padding.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/core/utils/genius_mode_enum.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/genius_mode_tips_list.dart';

class DetailsGeniusModeBottomSheet extends StatelessWidget {
  const DetailsGeniusModeBottomSheet({
    super.key,
    required this.controller,
    required this.geniusMode,
  });

  final TextEditingController controller;
  final GeniusMode geniusMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.globalPadding,
      child: Row(
        children: [
          Text(
            '${controller.text.length} / 1500',
            style: AppStyles.styleSemiBold17(context),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  final tips = geniusMode == GeniusMode.userInfo
                      ? GeniusModeTipsList.userInfoTips
                      : GeniusModeTipsList.instructionsTips;
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "tips",
                            style: AppStyles.styleSemiBold20(context),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: tips.map(
                              (tips) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Text(
                                    tips,
                                    style: AppStyles.styleRegular16(context),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: InkWell(
                                onTap: () => context.pop(),
                                child: Text(
                                  "Okay",
                                  style: AppStyles.styleSemiBold18(context),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Row(
              children: [
                const Icon(FeatherIcons.eye),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  'Show tips',
                  style: AppStyles.styleSemiBold17(context),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
