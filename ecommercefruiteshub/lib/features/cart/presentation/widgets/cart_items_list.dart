import 'package:easy_localization/easy_localization.dart';
import 'package:ecommercefruiteshub/core/widgets/custom_no_results__widget.dart';
import 'package:flutter/material.dart';

import '../../domain/entites/cart_entity.dart';
import 'cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems});
  final CartEntity cartItems;
  @override
  Widget build(BuildContext context) {
    if (cartItems.items.isEmpty) {
      return SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CustomNoResultWidget(text: 'cart_is_empty'.tr())],
        ),
      );
    } else {
      return SliverList.builder(
        itemBuilder: (context, index) =>
            CartItem(cartItem: cartItems.items[index]),
        itemCount: cartItems.items.length,
      );
    }
  }
}
