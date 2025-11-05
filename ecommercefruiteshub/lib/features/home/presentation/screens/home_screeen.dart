import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../widgets/home_screen_body.dart';

class HomeScreeen extends StatelessWidget {
  const HomeScreeen({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ProductsCubit>()..getBestSellingProducts(),
      child: SafeArea(child: HomeScreenBody(user: user)),
    );
  }
}
