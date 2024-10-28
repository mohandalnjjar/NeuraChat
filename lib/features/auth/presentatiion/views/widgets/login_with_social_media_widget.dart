import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/features/theme/presentation/managers/cubit/theme_cubit.dart';

class LoginSocialMeadiWidget extends StatelessWidget {
  const LoginSocialMeadiWidget({
    super.key,
    required this.image,
    required this.onTap,
  });
  final String image;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeCubitState>(
      builder: (context, state) {
        return InkWell(
          onTap: onTap,
          child: Container(
            height: 50,
            width: 80,
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: BlocProvider.of<ThemeCubit>(context).themeMode
                  ? const Color(0xffF8F8FA).withOpacity(0.1)
                  : const Color(0xffF8F8FA),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(image),
          ),
        );
      },
    );
  }
}
