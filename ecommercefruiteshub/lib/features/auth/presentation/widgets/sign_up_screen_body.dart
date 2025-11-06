import 'package:easy_localization/easy_localization.dart';
import 'package:ecommercefruiteshub/features/auth/presentation/widgets/sign_up_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/custom_widgets/hv_hvnt_rich_text.dart';
import '../../../../core/helper_functions/spacing.dart';
import '../../../../core/utils/k_padding.dart';
import '../cubits/sign_up_cubit/sign_up_cubit.dart';
import 'custom_check_box.dart';
import 'sign_up_form.dart';

class SignUpScreenBody extends StatelessWidget {
  SignUpScreenBody({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String email, password, name;
  ValueNotifier<AutovalidateMode> notifier = ValueNotifier(
    AutovalidateMode.disabled,
  );
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SignUpCubit>(context);
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: KPadding.horizontal16,
                  child: Column(
                    children: [
                      highspace(height: 10),
                      SignUpForm(
                        notifier: notifier,
                        formKey: formKey,
                        email: (value) {
                          email = value!;
                        },
                        name: (value) {
                          name = value!;
                        },
                        password: (value) {
                          password = value!;
                        },
                      ),
                      highspace(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomCheckbox(
                            onChanged: (value) {
                              cubit.isChecked = value;
                            },
                          ),
                          widthspace(width: 10),
                          Flexible(
                            fit: FlexFit.tight,
                            child: HvHvntRichText(
                              description: "accept".tr(),
                              clickableText: "conditions".tr(),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                      highspace(height: 20),
                      SignUpBlocConsumer(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            cubit.signUpWithEmailAndPassWord(
                              name: name,
                              email: email,
                              password: password,
                            );
                          } else {
                            notifier.value = AutovalidateMode.always;
                          }
                        },
                      ),
                      highspace(height: 20),
                      HvHvntRichText(
                        description: "already_have_an_account".tr(),
                        clickableText: "login".tr(),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
