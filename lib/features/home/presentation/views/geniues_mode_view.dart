import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neura_chat/features/home/data/repos/home_repo_impl.dart';
import 'package:neura_chat/features/home/presentation/managers/get_genius_mode_instructions_bloc/get_genius_mode_instructions_bloc.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/genius_mode_view_app_bar.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/genius_mode_view_body.dart';

class GeniuesModeView extends StatelessWidget {
  const GeniuesModeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetGeniusModeInstructionsBloc(
        HomeRepoImpl(),
      )..add(
          PerformGetGeniusModeInstructionsEvent(),
        ),
      child: const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: GeniusModeViewAppBar(),
        ),
        body: SafeArea(
          child: GeniusModeViewBody(),
        ),
      ),
    );
  }
}
