import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/build_app_bar.dart';
import '../widgets/order_track_section/order_track_screen_body.dart';

class OrderTrackScreen extends StatelessWidget {
  const OrderTrackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "order_track".tr(),
        showBackButton: true,
      ),
      body: OrderTrackScreenBody(),
    );
  }
}
