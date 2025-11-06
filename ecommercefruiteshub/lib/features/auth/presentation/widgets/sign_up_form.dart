import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/custom_widgets/custom_text_form_filled.dart';
import '../../../../core/helper_functions/spacing.dart';
import '../../../../core/widgets/password_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.name,
    required this.email,
    required this.password,
    required this.notifier,
  });
  final GlobalKey<FormState> formKey;
  final ValueChanged<String?> name;
  final ValueChanged<String?> email;
  final ValueChanged<String?> password;
  final ValueNotifier<AutovalidateMode> notifier;
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AutovalidateMode>(
      valueListenable: widget.notifier,
      builder: (context, value, child) => Form(
        key: widget.formKey,
        autovalidateMode: value,
        child: Column(
          children: [
            CustomTextFormFilled(
              onSaved: widget.name,
              formType: FormType.text,
              icon: SizedBox(),
              hintText: 'name'.tr(),
            ),
            highspace(height: 20),
            CustomTextFormFilled(
              formType: FormType.email,

              onSaved: widget.email,
              icon: SizedBox(),
              hintText: 'email'.tr(),
            ),
            highspace(height: 20),
            PasswordField(onSaved: widget.password, hintText: "password".tr()),
          ],
        ),
      ),
    );
  }
}
