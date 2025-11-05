import '../entites/cart_entity.dart';
import '../entites/cart_item_entity.dart';

abstract class CartRepoInterface {
  CartEntity addToCart({required CartItemEntity cartItem});
  CartEntity removeFromCart({
    required CartItemEntity cartItem,
    bool? isDecrese,
  });
}
