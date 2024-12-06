import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:neura_chat/core/constants/app_palette.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';
import 'package:neura_chat/features/home/presentation/managers/get_messages_bloc/get_messages_bloc.dart';
import 'package:neura_chat/features/home/presentation/managers/send_message_cubit/send_message_cubit.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';
import 'package:uuid/uuid.dart';

class SendMessageWidget extends StatefulWidget {
  const SendMessageWidget({
    super.key,
    this.hintText,
    this.contentPadding,
    required this.uploadAssetsButtom,
    this.initialValue,
  });

  final String? hintText;
  final String? initialValue;
  final EdgeInsetsGeometry? contentPadding;
  final Widget uploadAssetsButtom;

  @override
  State<SendMessageWidget> createState() => _SendMessageWidgetState();
}

class _SendMessageWidgetState extends State<SendMessageWidget> {
  final TextEditingController controller = TextEditingController();
  final HomeRepoImpl homeRepoImpl = HomeRepoImpl();
  late String chatId;

  @override
  void initState() {
    super.initState();
    chatId = const Uuid().v4();

    controller.text = widget.initialValue ?? "";
    isEmpty = controller.text.trim().isEmpty;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isEmpty = true;
  bool fetched = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeCubitState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: BlocProvider.of<ThemeCubit>(context).getThemeMode
                  ? AppPalette.kSecondaryDarkColor
                  : AppPalette.kwhitModeMessageColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  maxLines: null,
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
                    hintText: widget.hintText,
                    contentPadding: widget.contentPadding,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
                Row(
                  children: [
                    isEmpty
                        ? Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(
                                    100,
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    EvaIcons.smilingFaceOutline,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  FeatherIcons.mic,
                                  size: 27,
                                ),
                              ),
                            ],
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
                    const Spacer(),
                    widget.uploadAssetsButtom,
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void sendToApi(BuildContext context, String message) {
    context.read<MessageCubit>().sendMessage(
          chatMessageModel: ChatMessageModel(
            chatId: chatId,
            createdAt: Timestamp.now(),
            message: Message(
              isUser: true,
              content: message,
            ),
          ),
        );

    if (!fetched) {
      BlocProvider.of<GetMessagesBloc>(context).add(
        FetchMessagesEvent(chatId: chatId),
      );
      setState(() {
        fetched = true;
      });
    }
    controller.clear();
    setState(() {
      isEmpty = true;
    });
  }
}
