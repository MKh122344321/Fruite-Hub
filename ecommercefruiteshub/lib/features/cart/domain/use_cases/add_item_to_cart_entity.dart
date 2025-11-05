import '../entites/cart_entity.dart';
import '../entites/cart_item_entity.dart';
import '../repo_interface/cart_repo_interface.dart';

class AddItemToCartEntityUseCase {
  final CartRepoInterface repo;

  AddItemToCartEntityUseCase({required this.repo});

  CartEntity call({required CartItemEntity cartItemEntity}) =>
      repo.addToCart(cartItem: cartItemEntity);
}
