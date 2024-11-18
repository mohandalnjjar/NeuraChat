import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:neura_chat/core/constants/app_palette.dart';
import 'package:neura_chat/features/home/data/models/message_model.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';
import 'package:neura_chat/features/home/predentation/managers/get_messages_bloc/get_messages_bloc.dart';
import 'package:neura_chat/features/home/predentation/managers/send_message_cubit/send_message_cubit.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';
import 'package:uuid/uuid.dart';

class SendMessageWidget extends StatefulWidget {
  const SendMessageWidget({
    super.key,
    this.hintText,
    this.contentPadding,
    required this.uploadAssetsButtom,
  });

  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final Widget uploadAssetsButtom;

  @override
  State<SendMessageWidget> createState() => _SendMessageWidgetState();
}

class _SendMessageWidgetState extends State<SendMessageWidget> {
  final TextEditingController _controller = TextEditingController();
  final HomeRepoImpl homeRepoImpl = HomeRepoImpl();
  late String chatId;

  @override
  void initState() {
    super.initState();
    chatId = const Uuid().v4();
  }

  @override
  void dispose() {
    _controller.dispose();
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
                  ? AppPalette.kwhitModeMessageColor
                  : AppPalette.kwhitDarkMessageColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  maxLines: null,
                  controller: _controller,
                  onFieldSubmitted: (message) async {
                    final message = _controller.text.trim();
                    if (message.isNotEmpty) {
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
                      _controller.clear();
                      setState(() {
                        isEmpty = true;
                      });
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      if (_controller.text.isEmpty) {
                        isEmpty = true;
                      } else {
                        isEmpty = false;
                      }
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
                                final message = _controller.text.trim();
                                if (message.isNotEmpty) {
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
                                    BlocProvider.of<GetMessagesBloc>(context)
                                        .add(
                                      FetchMessagesEvent(chatId: chatId),
                                    );
                                    setState(() {
                                      fetched = true;
                                    });
                                  }
                                  _controller.clear();
                                  setState(() {
                                    isEmpty = true;
                                  });
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
}
