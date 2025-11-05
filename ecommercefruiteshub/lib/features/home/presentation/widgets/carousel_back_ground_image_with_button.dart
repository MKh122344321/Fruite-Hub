import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as P;

import '../../../../core/custom_widgets/custom_elevated_button.dart';
import '../../../../core/helper_functions/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/k_padding.dart';

class CarouselBackGroundImageWithButton extends StatelessWidget {
  const CarouselBackGroundImageWithButton({super.key});
  final int discoubtAmount = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: P.Svg(Assets.imagesFeaturedItemBackground),
        ),
      ),
      child: Column(
        children: [
          Spacer(),
          Text(
            'Eid_offers'.tr(),
            style: TextStyles.regular13.copyWith(
              color: Colors.white,
              fontFamily: "Cairo",
            ),
          ),
          Spacer(),
          Text(
            '${'discount'.tr()} $discoubtAmount%',
            style: TextStyles.bold19.copyWith(color: Colors.white),
          ),
          highspace(height: 20),
          Padding(
            padding: KPadding.horizontal16,
            child: CustomElevatedButton(
              borderRaduis: 0,
              buttonTextStyle: TextStyles.bold13.copyWith(
                color: Colors.black,
                fontFamily: "Cairo",
              ),
              hightOfTheButton: 20,
              buttonBackGroundColor: Colors.white,
              buttonText: "shopping_now".tr(),
            ),
          ),
          highspace(height: 30),
        ],
      ),
    );
  }
}
