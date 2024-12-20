import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/home/presentation/managers/fetch_user_data_bloc/fetch_user_data_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WelcomeHeaderSection extends StatelessWidget {
  const WelcomeHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchUserDataBloc, FetchUserDataState>(
      builder: (context, state) {
        if (state is FetchUserDataLaoding) {
          return const Skeletonizer(
            enabled: true,
            child: Text("this is loading for skiltoo"),
          );
        } else if (state is FetchUserDataSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hello, ${state.userModel.name}",
                style: AppStyles.styleBold28(context),
              ),
            ],
          );
        } else if (state is FetchUserDataFailed) {
          return Text(state.errorMessage);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
