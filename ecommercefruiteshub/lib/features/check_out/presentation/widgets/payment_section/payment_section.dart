import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/order_entity.dart';
import '../../../../../core/entities/shipping_address_entity.dart';
import '../../../../../core/helper_functions/spacing.dart';
import 'delivery_address_card.dart';
import 'order_summury.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final orderEntityAddress = context
        .read<OrderInputEntity>()
        .shippingAddressEntity;
    final fullAddress =
        " ${orderEntityAddress.name} ${orderEntityAddress.phone} ${orderEntityAddress.address} ${orderEntityAddress.city} ${orderEntityAddress.floor}";
    return Column(
      children: [
        OrderSummary(),
        highspace(height: 20),
        DeliveryAddressCard(
          title: "shipping_address".tr(),
          address: fullAddress,
          onEdit: () {
            context.read<OrderInputEntity>().shippingAddressEntity =
                ShippingAddressEntity();
            pageController.jumpToPage(1);
          },
        ),
      ],
    );
  }
}
