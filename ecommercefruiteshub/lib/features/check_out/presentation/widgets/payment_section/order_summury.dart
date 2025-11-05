import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/order_entity.dart';
import '../../../../../core/utils/app_decorations.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final orderEntity = context.read<OrderInputEntity>();
    return Container(
      decoration: AppDecorations.greyBoxDecorationUnSelected,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'order_summary'.tr(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Sub-total row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('sub_total'.tr(), style: TextStyle(fontSize: 16)),
                Text(
                  '${orderEntity.cartEntity.calculateTotalPrice()} ${"currency".tr()}'
                      .tr(),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Divider(),

            // Delivery fee row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('delivery'.tr(), style: TextStyle(fontSize: 16)),
                Text(
                  '${orderEntity.calculateShippingCost()} جنيه',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Divider(),

            // Total amount row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "total".tr(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${orderEntity.cartEntity.calculateTotalPrice() + orderEntity.calculateShippingCost()} جنيه',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
