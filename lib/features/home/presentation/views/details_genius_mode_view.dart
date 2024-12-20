import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/constants/app_padding.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/core/utils/genius_mode_enum.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';
import 'package:neura_chat/features/home/presentation/managers/save_genius_mode_data_bloc/genius_mode_data_save_bloc.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/details_genius_mode_app_bar.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/details_genius_mode_buttom_sheet.dart';

class DetailsGeniusModeView extends StatefulWidget {
  const DetailsGeniusModeView({
    super.key,
    required this.headTitle,
    required this.geniusMode,
  });

  final String headTitle;
  final GeniusMode geniusMode;

  @override
  State<DetailsGeniusModeView> createState() => _DetailsGeniusModeViewState();
}

class _DetailsGeniusModeViewState extends State<DetailsGeniusModeView> {
  final TextEditingController controller = TextEditingController();
  bool isContentChanged = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeniusModeDataSaveBloc(
        homeRepoImpl: HomeRepoImpl(),
      ),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: DetailsGeniusModeAppBar(
            isContentChanged: isContentChanged,
            controller: controller,
            geniusMode: widget.geniusMode,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: AppPadding.globalPadding,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    widget.headTitle,
                    style: AppStyles.styleSemiBold23(context),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        isContentChanged = true;
                      });
                    },
                    controller: controller,
                    autofocus: true,
                    maxLines: null,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1500),
                    ],
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      fillColor: Colors.transparent,
                      filled: true,
                    ),
                    style: AppStyles.styleSemiBold17(context),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: DetailsGeniusModeBottomSheet(controller: controller),
      ),
    );
  }
}
