import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/cart/domain/entites/cart_item_entity.dart';
import '../../features/cart/presentation/cubit/cubit/cart_entity_cubit.dart';
import '../entities/product_entity.dart';
import '../helper_functions/spacing.dart';
import '../theming/app_colors.dart';
import '../theming/app_text_styles.dart';
import 'custom_network_image.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});

  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        return Container(
          height: c.maxHeight,
          width: c.maxWidth,
          decoration: ShapeDecoration(
            color: const Color(0xFFF3F5F7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline),
                ),
              ),
              Positioned.fill(
                child: Column(
                  children: [
                    highspace(height: 20),
                    Flexible(
                      child: CustomNetworkImage(
                        imageUrl: productEntity.imageUrl!,
                      ),
                    ),
                    highspace(height: 10),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          productEntity.name,
                          textAlign: TextAlign.right,
                          style: TextStyles.semiBold16,
                        ),
                        subtitle: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '${productEntity.price}${"currency".tr()} ',
                                style: TextStyles.bold13.copyWith(
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                              TextSpan(
                                text: '/',
                                style: TextStyles.bold13.copyWith(
                                  color: AppColors.lightSecondaryColor,
                                ),
                              ),
                              TextSpan(
                                text: ' ',
                                style: TextStyles.semiBold13.copyWith(
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                              TextSpan(
                                text: 'KG'.tr(),
                                style: TextStyles.semiBold13.copyWith(
                                  color: AppColors.lightSecondaryColor,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.right,
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            context.read<CartEntityCubit>().addToCart(
                              cartItem: CartItemEntity(
                                productEntity: productEntity,
                                quantity: 1,
                              ),
                            );
                          },
                          child: const CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    highspace(height: 20),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
