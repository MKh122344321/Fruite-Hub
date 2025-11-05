import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

import '../cubits/products_cubit/products_cubit.dart';
import '../theming/app_colors.dart';
import '../utils/app_images.dart';
import 'custom_text_form_filled.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFilled(
      phoneController: context.read<ProductsCubit>().searchController,
      onChanged: (value) {
        context.read<ProductsCubit>().searchProduct(query: value);
      },
      backGroundColor: AppColors.white,
      haveSufficIcon: true,
      suffixIcon: FittedBox(
        fit: BoxFit.scaleDown,
        child: SvgPicture.asset(Assets.imagesFilter),
      ),
      icon: FittedBox(
        fit: BoxFit.scaleDown,
        child: SvgPicture.asset(Assets.imagesSearchIcon),
      ),
      hintText: 'search'.tr(),
    );
  }
}
