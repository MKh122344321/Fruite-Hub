import 'package:easy_localization/easy_localization.dart';
import 'package:ecommercefruiteshub/core/helper_functions/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../core/custom_widgets/custom_sliver_grid.dart';
import '../../../../core/helper_functions/build_error_bar.dart';
import '../../../../core/helper_functions/get_dummy_product.dart';
import '../../../../core/widgets/custom_no_results__widget.dart';
import '../../../../core/widgets/fruit_item.dart';

class ProductsScreenBlocConsumer extends StatelessWidget {
  const ProductsScreenBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProductsCubit>(context);
    return BlocConsumer(
      bloc: cubit,
      listenWhen: (previous, current) =>
          current is AllProductsForAppLoaded ||
          current is AllProductsForAppLoading ||
          current is AllProductsForAppFailure ||
          current is SearchProductsLoaded ||
          current is SearchProductsFailure ||
          current is SearchProductsEmpty,
      listener: (context, state) {
        if (state is AllProductsForAppFailure) {
          showBar(context, state.message);
        }
        if (state is SearchProductsFailure) {
          showBar(context, state.message);
          print(state.message);
        }
      },
      buildWhen: (previous, current) =>
          current is AllProductsForAppLoading ||
          current is AllProductsForAppLoaded ||
          current is AllProductsForAppFailure ||
          current is SearchProductsLoaded ||
          current is SearchProductsFailure ||
          current is SearchProductsEmpty,
      builder: (context, state) {
        if (state is AllProductsForAppFailure) {
          return SliverToBoxAdapter(child: Text(state.message));
        } else if (state is AllProductsForAppLoaded) {
          return CustomSliverGrid(
            childOfSliverGridBuilder: (context, index) =>
                FruitItem(productEntity: state.products[index]),
            itemCount: state.products.length,
          );
        } else if (state is SearchProductsLoaded) {
          print(state.products.length);
          return CustomSliverGrid(
            childOfSliverGridBuilder: (context, index) =>
                FruitItem(productEntity: state.products[index]),
            itemCount: state.products.length,
          );
        } else if (state is SearchProductsEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: CustomNoResultWidget(text: 'search_result_not_found'.tr()),
            ),
          );
        } else if (state is SearchProductsFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  Icon(Icons.error, size: 50, color: Colors.red),
                  highspace(height: 20),
                  Text(state.message),
                ],
              ),
            ),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: state is AllProductsForAppLoading,
            child: CustomSliverGrid(
              childOfSliverGridBuilder: (context, index) =>
                  FruitItem(productEntity: getDummyProduct()),
              itemCount: 10,
            ),
          );
        }
      },
    );
  }
}
