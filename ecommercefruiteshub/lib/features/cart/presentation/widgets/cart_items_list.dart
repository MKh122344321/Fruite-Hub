import 'package:flutter/material.dart';

import '../../domain/entites/cart_entity.dart';
import 'cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems});
  final CartEntity cartItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) =>
          CartItem(cartItem: cartItems.items[index]),
      itemCount: cartItems.items.length,
    );
  }
}
