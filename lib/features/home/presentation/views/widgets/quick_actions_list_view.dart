import 'package:flutter/material.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/quick_actions_widget.dart';

class QuickActionsListView extends StatelessWidget {
  const QuickActionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .22,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const QuickActionsWidget();
        },
      ),
    );
  }
}
