import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../core/custom_widgets/custom_sliver_grid.dart';
import '../../../../core/helper_functions/build_error_bar.dart';
import '../../../../core/helper_functions/get_dummy_product.dart';
import '../../../../core/widgets/fruit_item.dart';

class HomeBodyBlocConsumer extends StatelessWidget {
  const HomeBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProductsCubit>(context);
    return BlocConsumer(
      bloc: cubit,
      buildWhen: (previous, current) =>
          current is BestSellingLoading ||
          current is BestSellingLoaded ||
          current is BestSellingFailure,
      builder: (context, state) {
        if (state is BestSellingFailure) {
          return SliverToBoxAdapter(child: Text(state.errMessage));
        } else if (state is BestSellingLoaded) {
          return CustomSliverGrid(
            childOfSliverGridBuilder: (context, index) => Skeletonizer(
              enabled: state is BestSellingLoading,
              child: FruitItem(productEntity: state.products[index]),
            ),
            itemCount: 4,
          );
        } else {
          return Skeletonizer.sliver(
            enabled: state is BestSellingLoading,
            child: CustomSliverGrid(
              childOfSliverGridBuilder: (context, index) =>
                  FruitItem(productEntity: getDummyProduct()),
              itemCount: getDummyProducts().length,
            ),
          );
        }
      },
      listenWhen: (previous, current) =>
          current is AllProductsLoaded ||
          current is AllProductsLoading ||
          current is AllProductsFailure,
      listener: (context, state) {
        if (state is BestSellingFailure) {
          showBar(context, state.errMessage);
        }
      },
    );
  }
}
