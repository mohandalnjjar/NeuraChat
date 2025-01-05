import 'package:flutter/material.dart';
import 'package:neura_chat/core/constants/app_padding.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: AppPadding.globalPadding, // Ensure this is valid
        child: const SizedBox(
          height: 100, // Adjust the height for
          child: Text('data'),
        ),
      ),
    );
  }
}
