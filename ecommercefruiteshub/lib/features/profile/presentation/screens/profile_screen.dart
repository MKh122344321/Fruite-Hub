import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/build_app_bar.dart';
import '../widgets/profile_details_section/profile_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "profile".tr(),
        showBackButton: true,
        showNotification: false,
      ),
      body: ProfileScreenBody(),
    );
  }
}
