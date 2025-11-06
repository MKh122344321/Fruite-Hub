import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/entities/order_entity.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/widgets/build_app_bar.dart';
import '../cubit/check_out_cubit/check_out_cubit.dart';
import '../widgets/check_out_bloc_consumer.dart';
import '../widgets/check_out_screen_body.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key, required this.orderInputEntity});
  final OrderInputEntity orderInputEntity;
  @override
  /*************  ✨ Windsurf Command ⭐  *************/
  /// Returns [CheckOutScreenBody].
  /// *****  9f08c6a0-c879-4934-a4c1-8c34999b2a4f  ******
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "Checkout".tr(),
        showNotification: false,
      ),
      body: BlocProvider(
        create: (context) => getIt.get<CheckOutCubit>(),
        child: Provider<OrderInputEntity>.value(
          builder: (context, child) => CheckOutBlocConsumer(),

          value: orderInputEntity,

          // child: CheckOutScreenBody(),
        ),
      ),
    );
  }
}
