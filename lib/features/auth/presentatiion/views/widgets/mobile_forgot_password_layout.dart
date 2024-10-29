// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:swift_mart/core/functions/show_meeage.dart';
// import 'package:swift_mart/core/utils/const/app_constance.dart';
// import 'package:swift_mart/core/utils/widgets/custom_loading_indicator.dart';
// import 'package:swift_mart/features/auth/presentatiion/managers/reset_password_cubit/rest_password_cubit.dart';
// import 'package:swift_mart/features/auth/presentatiion/views/widgets/forgot_password_from.dart';
// import 'package:swift_mart/generated/l10n.dart';

// class MobileForgotPassswordBody extends StatelessWidget {
//   const MobileForgotPassswordBody({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: BlocConsumer<RestPasswordCubit, RestPasswordState>(
//         listener: (context, state) {
//           showDialog(
//             context: context,
//             builder: (context) => CustomLoadingIndicator(
//               inAsyncCall: state is RestPasswordLoading ? true : false,
//             ),
//           );
//           if (state is RestPasswordFailed) {
//             showedScaffoldMessage(
//                 context: context, message: state.errorMessage);
//             context.pop();
//           } else if (state is RestPasswordDone) {
//             showedScaffoldMessage(
//               context: context,
//               message: S.of(context).CheckYourEmial,
//             );

//             GoRouter.of(context).pushReplacement(
//               RouterPath.kLoginView,
//             );
//           }
//         },
//         builder: (context, state) {
//           return const ForGotPasswordFrom();
//         },
//       ),
//     );
//   }
// }
