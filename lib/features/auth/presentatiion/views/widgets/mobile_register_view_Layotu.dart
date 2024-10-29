// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:neura_chat/core/constants/app_routes.dart';
// import 'package:neura_chat/features/auth/presentatiion/managers/signup_cubit/sign_up_cubit.dart';
// class MobileRegisterViewLayotu extends StatelessWidget {
//   const MobileRegisterViewLayotu({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: BlocListener<SignUpCubit, SignUpState>(
//             listener: (context, state) {
//               showDialog(
//                 context: context,
//                 builder: (context) => CustomLoadingIndicator(
//                   inAsyncCall: state is SignUpLoadding ? true : false,
//                 ),
//               );
//               if (state is SignUpSuccess) {
//                 GoRouter.of(context)
//                     .pushReplacement(AppRoutes.kHomeViewRouter);
//                 showedScaffoldMessage(
//                     context: context, message: 'Successfully Created');
//               }
//               if (state is SignUpFailure) {
//                 showedScaffoldMessage(
//                     context: context, message: state.errorMessage);
//               }
//             },
//             child: const RegisterForm(),
//           ),
//         ),
//       ),
//     );
//   }
// }
