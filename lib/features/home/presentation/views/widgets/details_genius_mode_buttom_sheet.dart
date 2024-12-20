import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_padding.dart';
import 'package:neura_chat/core/constants/text_styles.dart';

class DetailsGeniusModeBottomSheet extends StatelessWidget {
  const DetailsGeniusModeBottomSheet({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

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
                          Text(
                            "Where are you based?",
                            style: AppStyles.styleRegular16(context),
                          ),
                          Text(
                            "What do you do for work?",
                            style: AppStyles.styleRegular16(context),
                          ),
                          Text(
                            "What is you hobbies ans interests?",
                            style: AppStyles.styleRegular16(context),
                          ),
                          Text(
                            "What is your name?",
                            style: AppStyles.styleRegular16(context),
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
