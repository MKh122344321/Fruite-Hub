import 'package:easy_localization/easy_localization.dart';
import 'package:ecommercefruiteshub/core/widgets/build_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../cubits/sign_up_cubit/sign_up_cubit.dart';
import '../widgets/sign_up_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignUpCubit(signUpWithEmailAndPasswordUseCase: getIt()),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: "sign_up".tr(),
          showBackButton: true,
          showNotification: false,
        ),
        body: SignUpScreenBody(),
      ),
    );
  }
}
