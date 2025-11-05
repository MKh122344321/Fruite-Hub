import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../core/custom_widgets/custom_search_bar.dart';
import '../../../../core/helper_functions/spacing.dart';
import '../../../../core/utils/k_padding.dart';
import 'best_selling_headline.dart';
import 'get_all_products_for_app_bloc_consumer.dart';

class ProductsScreenBody extends StatelessWidget {
  const ProductsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProductsCubit>(context);

    return Padding(
      padding: KPadding.horizontal16,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                highspace(height: 20),
                CustomSearchBar(),
                highspace(height: 20),

                BlocBuilder<ProductsCubit, ProductsState>(
                  bloc: cubit,
                  buildWhen: (previous, current) =>
                      current is AllProductsForAppLoaded ||
                      current is SearchProductsLoaded,

                  builder: (context, state) {
                    return ProductsNumberWithFiltterHeadLine(
                      onTap: () {},
                      count: cubit.productsLength,
                    );
                  },
                ),
                highspace(height: 20),
              ],
            ),
          ),

          GetAllProductsForAppBlocConsumer(),
        ],
      ),
    );
  }
}
