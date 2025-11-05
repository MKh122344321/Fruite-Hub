import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/services/shared_preferences_singleton.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/routes_names.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  @override
  void initState() {
    loadOnBoarding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment
          .stretch, // strech is to make the column take the whole width of the screen
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: context.locale.languageCode == 'ar'
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: SvgPicture.asset(Assets.imagesPlant, fit: BoxFit.fill),
            ),
          ],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(Assets.imagesSplashBottom, fit: BoxFit.fill),
      ],
    );
  }

  void loadOnBoarding() {
    bool isOnBoardingSeen = Prefs.getBool(kIsOnBoardingSeen);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(
        isOnBoardingSeen ? RoutesNames.signIn : RoutesNames.onboarding,
      );
    });
  }
}
