import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/custom_widgets/custom_elevated_button.dart';
import '../../../../../core/utils/k_padding.dart';
import '../../../../../core/widgets/custom_no_results__widget.dart';
import '../../../domain/entities/order_track_entity.dart';
import '../../cubit/cubit/main_profile_cubit.dart';
import 'track_way.dart';

class OrderTrackScreenBody extends StatelessWidget {
  const OrderTrackScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: KPadding.all16,
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                BlocBuilder<MainProfileCubit, MainProfileState>(
                  bloc: BlocProvider.of<MainProfileCubit>(context),
                  buildWhen: (previous, current) =>
                      current is OrderTrackLoading ||
                      current is OrderTrackLoaded ||
                      current is OrderTrackFailure ||
                      current is OrderTrackEmpty,
                  builder: (context, state) {
                    if (state is OrderTrackFailure) {
                      return SliverToBoxAdapter(child: Text(state.message));
                    }
                    if (state is OrderTrackLoading) {
                      return Skeletonizer.sliver(
                        child: TrackWay(track: getDummyTrackList()),
                      );
                    }
                    if (state is OrderTrackLoaded) {
                      return TrackWay(track: state.ordersTrackEntity);
                    }
                    if (state is OrderTrackEmpty) {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: CustomNoResultWidget(text: 'no_order'.tr()),
                        ),
                      );
                    }

                    return SliverToBoxAdapter(child: Text("loading".tr()));
                  },
                ),
              ],
            ),
          ),

          // Expanded(
          //   child: OrderDetailsWidget(
          //     orderNumber: "#123",
          //     orderDate: DateTime.now(),
          //     price: 1263,
          //     itemCount: 10,
          //   ),
          // ),
          CustomElevatedButton(
            buttonText: "update_orders".tr(),
            onTap: () {
              BlocProvider.of<MainProfileCubit>(context).getOrderTrack();
            },
          ),
        ],
      ),
    );
  }
}
