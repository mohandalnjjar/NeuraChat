import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/core/constants/app_padding.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/home/data/models/fast_action_model.dart';
import 'package:neura_chat/features/home/presentation/managers/fast_actions_bloc/fast_actions_bloc.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/fast_actions_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FastActionsListView extends StatelessWidget {
  const FastActionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FastActionsBloc, FastActionsBlocState>(
      builder: (context, state) {
        if (state is FetchFastActionsBlocLoading) {
          return Skeletonizer(
            enabled: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .22,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return FastActionsWidget(
                        fastActionModel: FastActionModel(
                          name: "name",
                          description: "description",
                          fastActionsList: [],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        if (state is FetchFastActionsBlocSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: AppPadding.globalPadding,
                child: Text(
                  "generate",
                  style: AppStyles.styleGreyReg16(context),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .22,
                child: ListView.builder(
                  itemCount: state.fastActions.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return FastActionsWidget(
                      fastActionModel: state.fastActions[index],
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is FetchFastActionsBlocFailed) {
          return Text(state.errorMessage);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
