import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/custom_widgets/custom_elevated_button.dart';
import '../../../../core/entities/order_entity.dart';
import '../../../../core/entities/shipping_address_entity.dart';
import '../../../../core/helper_functions/get_user.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/utils/k_padding.dart';
import '../../../check_out/presentation/screens/check_out_screen.dart';
import '../../domain/entites/cart_entity.dart';
import '../cubit/cubit/cart_entity_cubit.dart';
import 'cart_items_list.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CartEntityCubit>(context);
    return Padding(
      padding: KPadding.horizontal16,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: KPadding.bottom16,
              child: CustomScrollView(
                slivers: [CartItemsList(cartItems: getIt.get<CartEntity>())],
              ),
            ),
          ),
          Padding(
            padding: KPadding.bottom16,
            child: getIt.get<CartEntity>().calculateTotalPrice() > 0
                ? CustomElevatedButton(
                    buttonText:
                        '${'checkout'.tr()} ${context.watch<CartEntityCubit>().cartEntity.calculateTotalPrice()} \$',
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,

                        screen: BlocProvider.value(
                          value: cubit,

                          child: CheckOutScreen(
                            orderInputEntity: OrderInputEntity(
                              getIt.get<CartEntity>(),
                              shippingAddressEntity: ShippingAddressEntity(),
                              uID: getUser().uid,
                            ),
                          ),
                        ),

                        withNavBar:
                            true, // set to false if you want to hide the bottom nav bar
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    },
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
