import 'package:ecommercefruiteshub/core/helper_functions/spacing.dart';
import 'package:ecommercefruiteshub/features/profile/presentation/widgets/order_track_section/custom_order_track.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper_functions/get_order_svg.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/utils/k_padding.dart';
import '../../../domain/entities/order_track_entity.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key, required this.track});
  final List<OrderTrack> track;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => Padding(
        padding: KPadding.horizontal16,
        child: Divider(color: AppColors.grey, thickness: 2),
      ),
      itemCount: track.length,
      itemBuilder: (context, index) {
        // final step = steps[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: InkWell(
            onTap: () {
              // Handle step tap
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => OrderTrackWidget(
                    orderNumber: track[index].uid,
                    orderDate: track[index].date,
                    price: track[index].totalPrice,
                    itemCount: 2,
                  ),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Circle Indicator for each step
                CircleAvatar(
                  radius: 18,
                  child: getSvg(index: track[index].currentStep),
                ),
                widthspace(width: 16),
                // Wrap the Column with Expanded
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        overflow: TextOverflow
                            .ellipsis, // Text will truncate if it's too long
                        track[index].uid,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        track[index].date,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
