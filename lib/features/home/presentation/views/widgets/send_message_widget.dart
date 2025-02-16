import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:neura_chat/core/constants/app_palette.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/presentation/managers/send_message_cubit/send_message_cubit.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';
import 'package:neura_chat/generated/l10n.dart';

class SendMessageWidget extends StatefulWidget {
  const SendMessageWidget({
    super.key,
    this.initialValue,
  });

  final String? initialValue;

  @override
  State<SendMessageWidget> createState() => _SendMessageWidgetState();
}

class _SendMessageWidgetState extends State<SendMessageWidget> {
  final TextEditingController controller = TextEditingController();

  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        FocusScope.of(context).requestFocus(focusNode);
      },
    );

    controller.text = widget.initialValue ?? "";
    isEmpty = controller.text.trim().isEmpty;
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void sendToApi(BuildContext context, String message) {
    context.read<SendMessageCubit>().sendMessage(
          message: Message(
            isUser: true,
            content: message,
          ),
        );
    controller.clear();
    setState(() {
      isEmpty = true;
    });
    FocusScope.of(context).unfocus();
  }

  bool isEmpty = true;
  bool fetched = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeCubitState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: BlocProvider.of<ThemeCubit>(context).getThemeMode
                ? AppPalette.kSecondaryDarkColor
                : AppPalette.kwhitModeMessageColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                focusNode: focusNode,
                maxLines: 10,
                minLines: 1,
                controller: controller,
                onFieldSubmitted: (message) async {
                  final message = controller.text.trim();
                  if (message.isNotEmpty) {
                    sendToApi(context, message);
                  }
                },
                onChanged: (value) {
                  setState(() {
                    isEmpty = value.trim().isEmpty;
                  });
                },
                decoration: InputDecoration(
                  hintText: S.of(context).AskAnyQuestion,
                  contentPadding: const EdgeInsets.all(10),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              isEmpty
                  ? Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () async {},
                        child: const Icon(
                          FeatherIcons.arrowUp,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          final message = controller.text.trim();
                          if (message.isNotEmpty) {
                            sendToApi(context, message);
                          }
                        },
                        child: const Icon(
                          FeatherIcons.arrowUp,
                          color: Colors.white,
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
