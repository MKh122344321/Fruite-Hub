import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/custom_widgets/hv_hvnt_rich_text.dart';
import '../../../../core/helper_functions/extensions.dart';
import '../../../../core/helper_functions/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/k_padding.dart';
import '../../../../core/utils/routes_names.dart';
import '../cubits/sign_in_cubit/sign_in_cubit.dart';
import 'custom_devider.dart';
import 'sign_in_with_email_and_pass_screen_bodu_bloc_consumer.dart';
import 'sign_in_with_email_form.dart';
import 'sign_in_with_google_bloc_consumer.dart';
import 'social_midia_button.dart';

class SignInScreenBody extends StatelessWidget {
  SignInScreenBody({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<AutovalidateMode> notifier = ValueNotifier(
    AutovalidateMode.disabled,
  );
  late String email = "";
  late String password = '';
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SignInCubit>(context);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: KPadding.horizontal16,
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      highspace(height: 10),
                      SignInWithEmailForm(
                        notifier: notifier,
                        formKey: formKey,
                        email: (value) {
                          email = value!;
                        },
                        password: (value) {
                          password = value!;
                        },
                      ),
                      Padding(
                        padding: KPadding.left12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'forget_password'.tr(),
                              style: TextStyles.regular13.copyWith(
                                color: AppColors.primaryColor,
                                fontFamily: "Cairo",
                              ),
                            ),
                          ],
                        ),
                      ),
                      highspace(height: 20),
                      SignInWithEmailAndPassScreenBodyBlocConsumer(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            cubit.signInWithEmailAndPassWord(
                              email: email,
                              password: password,
                            );
                          } else {
                            notifier.value = AutovalidateMode.always;
                          }
                        },
                      ),
                      highspace(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HvHvntRichText(
                            description: "dont_have_account".tr(),
                            clickableText: "sign_up".tr(),
                            onTap: () {
                              context.pushNamed(RoutesNames.signup);
                            },
                            descriptionStyle: TextStyles.semiBold16.copyWith(
                              fontFamily: "Cairo",
                              color: AppColors.grey,
                            ),
                            clickableTextStyle: TextStyles.semiBold16.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      highspace(height: 20),
                      CustomDevider(),
                      highspace(height: 20),

                      SignInWithGoogleBlocConsumer(
                        onTap: () {
                          cubit.signInWithGoogle();
                        },
                      ),
                      highspace(height: 20),
                      SocialMidiaButton(
                        imgUrl: Assets.imagesFacebookIcon,
                        onTap: () {},
                        textButton: 'continue_with_facebook'.tr(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
