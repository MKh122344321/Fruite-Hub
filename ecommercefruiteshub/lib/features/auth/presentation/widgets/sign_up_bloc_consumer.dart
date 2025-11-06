import 'package:easy_localization/easy_localization.dart';
import 'package:ecommercefruiteshub/core/custom_widgets/custom_elevated_button.dart';
import 'package:ecommercefruiteshub/core/helper_functions/build_error_bar.dart';
import 'package:ecommercefruiteshub/core/widgets/custom_progress_hud.dart';
import 'package:ecommercefruiteshub/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocConsumer extends StatelessWidget {
  const SignUpBlocConsumer({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SignUpCubit>(context);
    return BlocConsumer<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignUpWithEmailAndPasswordSuccess ||
          current is SignUpWithEmailAndPasswordFailure,

      listener: (context, state) {
        if (state is SignUpWithEmailAndPasswordSuccess) {
          // Prefs.setString(kUserData, state.user.toMap());

          Navigator.pop(context);
        }
        if (state is SignUpWithEmailAndPasswordFailure) {
          showBar(context, state.message);
        }
      },
      bloc: cubit,
      buildWhen: (previous, current) =>
          current is SignUpWithEmailAndPasswordLoading ||
          current is SignUpWithEmailAndPasswordSuccess ||
          current is SignUpWithEmailAndPasswordFailure,
      builder: (context, state) {
        return SizedBox(
          height: 60,
          child: CustomProgressHud(
            isLoading: state is SignUpWithEmailAndPasswordLoading,
            child: CustomElevatedButton(
              buttonText: 'sign_up'.tr(),
              onTap: onTap,
            ),
          ),
        );
      },
    );
  }
}
