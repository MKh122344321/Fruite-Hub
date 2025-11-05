import 'package:easy_localization/easy_localization.dart';
import '../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../core/widgets/build_app_bar.dart';
import '../widgets/best_selling_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellingScreen extends StatelessWidget {
  const BestSellingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductsCubit>(context).getBestSellingProducts();
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "best_selling".tr(),
        showBackButton: true,
      ),
      body: BestSellingScreenBody(),
    );
  }
}
