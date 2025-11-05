import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/helper_functions/get_user.dart';
import '../../../../core/helper_functions/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../auth/domain/entities/user_entity.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: CustomNetworkImage(imageUrl: getUser().profilePicture ?? ""),
          ),
        ),
        widthspace(width: 20),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('welcome'.tr(), style: TextStyles.bold16),

            Flexible(
              child: Text(
                user.name,
                style: TextStyles.bold16.copyWith(color: AppColors.black),
              ),
            ),
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: AppColors.green50,
            child: SvgPicture.asset(Assets.imagesNotification),
          ),
        ),
      ],
    );
  }
}
