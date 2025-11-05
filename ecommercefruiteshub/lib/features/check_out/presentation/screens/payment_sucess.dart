import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/build_app_bar.dart';
import '../../../../core/entities/order_entity.dart';
import '../widgets/payment_section/payment_success_body.dart';
import 'package:flutter/material.dart';

class PaymentSucess extends StatelessWidget {
  const PaymentSucess({super.key, required this.order});
  final OrderInputEntity order;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "payment_success".tr(),
        showBackButton: false,
        showNotification: false,
      ),
      body: PaymentSuccessBody(orderId: order.uID),
    );
  }
}
