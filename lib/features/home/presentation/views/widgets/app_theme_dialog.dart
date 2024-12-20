import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neura_chat/core/constants/text_styles.dart';
import 'package:neura_chat/features/theme/presentation/managers/cubit/theme_cubit.dart';

class AppThemeDialog extends StatefulWidget {
  const AppThemeDialog({
    super.key,
  });

  @override
  State<AppThemeDialog> createState() => _AppThemeDialogState();
}

class _AppThemeDialogState extends State<AppThemeDialog> {
  late bool themeModeValue;

  @override
  void initState() {
    themeModeValue = BlocProvider.of<ThemeCubit>(context).getThemeMode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Theme Mode",
              style: AppStyles.styleSemiBold23(context),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  themeModeValue = false;
                });
              },
              child: ListTile(
                title: Text(
                  'Light',
                  style: AppStyles.styleRegular18(context),
                ),
                trailing: Radio<bool>(
                  value: false,
                  onChanged: (bool? value) {
                    if (value != null) {
                      setState(() {
                        themeModeValue = value;
                      });
                    }
                  },
                  groupValue: themeModeValue,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(
                  () {
                    themeModeValue = true;
                  },
                );
              },
              child: ListTile(
                title: Text(
                  'Dark',
                  style: AppStyles.styleRegular18(context),
                ),
                trailing: Radio<bool>(
                  value: true,
                  onChanged: (bool? value) {
                    if (value != null) {
                      setState(
                        () {
                          themeModeValue = value;
                        },
                      );
                    }
                  },
                  groupValue: themeModeValue,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                BlocProvider.of<ThemeCubit>(context)
                    .changAppTheme(themeValue: themeModeValue);
                context.pop();
              },
              child: Text(
                "Okay",
                style: AppStyles.styleRegular16(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
