import 'package:flutter/material.dart';
import 'package:neura_chat/features/home/presentation/views/widgets/automation_dialog_list_item.dart';

class AutomationDialogList extends StatelessWidget {
  const AutomationDialogList({
    super.key,
    required this.fastActionsList,
  });

  final List<String> fastActionsList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: fastActionsList.length,
            itemBuilder: (context, index) {
              return AutomationDialogListItem(
                prompt: fastActionsList[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
