import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/custom_widgets/custom_text_form_filled.dart';
import '../../../../../core/entities/order_entity.dart';

class AddressForm extends StatelessWidget {
  const AddressForm({super.key, required this.formKey, required this.notifier});
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> notifier;
  @override
  Widget build(BuildContext context) {
    final orderEntity = context.read<OrderInputEntity>().shippingAddressEntity;
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (context, value, child) => Form(
        key: formKey,
        autovalidateMode: value,
        child: Column(
          children: [
            CustomTextFormFilled(
              icon: SizedBox(),
              onSaved: (value) {
                orderEntity.name = value;
              },

              hintText: "name".tr(),
            ),
            CustomTextFormFilled(
              icon: SizedBox(),
              onSaved: (value) {
                orderEntity.email = value;
              },
              hintText: "email".tr(),
            ),
            CustomTextFormFilled(
              icon: SizedBox(),
              onSaved: (value) {
                orderEntity.city = value;
              },
              hintText: "city".tr(),
            ),
            CustomTextFormFilled(
              icon: SizedBox(),
              onSaved: (value) {
                orderEntity.floor = value;
              },

              hintText: "floor".tr(),
            ),
            CustomTextFormFilled(
              icon: SizedBox(),
              onSaved: (value) {
                orderEntity.phone = value;
              },
              hintText: "phone".tr(),
            ),
            CustomTextFormFilled(
              icon: SizedBox(),
              onSaved: (value) {
                orderEntity.address = value;
              },
              hintText: "address".tr(),
            ),
          ],
        ),
      ),
    );
  }
}
