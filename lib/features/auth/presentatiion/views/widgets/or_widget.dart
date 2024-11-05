import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              height: 10,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7),
            child: Text(
              'OR',
            ),
          ),
          Expanded(
            child: Divider(
              height: 10,
            ),
          ),
        ],
      ),
    );
  }
}
