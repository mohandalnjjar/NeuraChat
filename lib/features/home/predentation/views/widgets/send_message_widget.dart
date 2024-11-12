import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:neura_chat/core/constants/app_palette.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';

class SendMessageWidget extends StatefulWidget {
  const SendMessageWidget({
    super.key,
    this.hintText,
    this.onFieldSubmitted,
    this.contentPadding,
    required this.uploadButtom,
  });

  final String? hintText;
  final void Function(String)? onFieldSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final Widget uploadButtom;

  @override
  State<SendMessageWidget> createState() => _SendMessageWidgetState();
}

class _SendMessageWidgetState extends State<SendMessageWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isEmpty = true;

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
                  controller: _controller,
                  onFieldSubmitted: widget.onFieldSubmitted,
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
                              onTap: () {},
                              child: const Icon(
                                FeatherIcons.arrowUp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                    const Spacer(),
                    widget.uploadButtom,
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
