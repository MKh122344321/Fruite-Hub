import '../entites/cart_entity.dart';
import '../entites/cart_item_entity.dart';
import '../repo_interface/cart_repo_interface.dart';

class RemoveItemFromCartEntity {
  final CartRepoInterface repo;
  RemoveItemFromCartEntity({required this.repo});

  CartEntity call({required CartItemEntity cartItemEntity, bool? isDecrese}) =>
      repo.removeFromCart(cartItem: cartItemEntity, isDecrese: isDecrese);
}
