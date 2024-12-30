import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/app_routes.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/core/utils/genius_mode_enum.dart';
import 'package:neura_chat/features/home/presentation/managers/fetch_user_data_bloc/fetch_user_data_bloc.dart';

class GeniusModeTextField extends StatefulWidget {
  const GeniusModeTextField({
    super.key,
    required this.title,
    required this.geniusMode,
  });

  final String title;
  final GeniusMode geniusMode;

  @override
  State<GeniusModeTextField> createState() => _GeniusModeTextFieldState();
}

class _GeniusModeTextFieldState extends State<GeniusModeTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.title,
          style: AppStyles.styleSemiBold18(context),
        ),
        GestureDetector(
          onTap: () => GoRouter.of(context).push(
            AppRoutes.kDetailsGeniusModeView,
            extra: {
              "title": widget.title,
              "geniusMode": widget.geniusMode,
            },
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 17),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: BlocBuilder<FetchUserDataBloc, FetchUserDataState>(
              builder: (context, state) {
                if (state is FetchUserDataLaoding) {
                  return const SizedBox(
                    height: 5,
                    child: CircularProgressIndicator(),
                  );
                } else if (state is FetchUserDataSuccess) {
                  final String instructions =
                      widget.geniusMode == GeniusMode.userInfo
                          ? state.userModel.geniusModelModel.userInstuctions
                          : state.userModel.geniusModelModel.responseMode;
                  return Text(
                    instructions.isNotEmpty == true
                        ? instructions
                        : 'Tap to add',
                    style: AppStyles.styleRegular18(context),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  );
                } else if (state is FetchUserDataFailed) {
                  return Text(
                    state.errorMessage,
                    style: AppStyles.styleRegular18(context),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  );
                } else {
                  return Text(
                    'Tap to add',
                    style: AppStyles.styleRegular18(context),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
