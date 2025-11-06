import 'package:easy_localization/easy_localization.dart';
import 'package:ecommercefruiteshub/core/widgets/build_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../cubits/sign_in_cubit/sign_in_cubit.dart';
import '../widgets/sign_in_screen_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(
        signInWithGoogleUseCase: getIt(),
        signInWithEmailAndPassword: getIt(),
      ),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: "login".tr(),
          showNotification: false,
          showBackButton: false,
        ),
        body: SignInScreenBody(),
      ),
    );
  }
}
