
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:neura_chat/core/constants/app_images.dart';
import 'package:neura_chat/features/home/presentation/managers/send_message_cubit/send_message_cubit.dart';
import 'package:neura_chat/features/home/presentation/managers/send_message_cubit/send_message_cubit_state.dart';

class NeuraLoadingOrb extends StatelessWidget {
  const NeuraLoadingOrb({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendMessageCubit, SendMessageState>(
      builder: (context, state) {
        if (state is MessageLoading) {
          return Lottie.asset(Assets.imagesLottieYaHabibi, height: 78);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
