import 'package:easy_localization/easy_localization.dart';
import 'package:ecommercefruiteshub/core/widgets/build_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/main_profile_screen_body.dart';

class MainProfileScreen extends StatelessWidget {
  const MainProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "my_account".tr(),
        showBackButton: false,
      ),
      body: MainProfileScreenBody(),
    );
  }
}
