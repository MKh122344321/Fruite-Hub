import 'package:easy_localization/easy_localization.dart';
import 'package:ecommercefruiteshub/core/helper_functions/get_user.dart';
import 'package:ecommercefruiteshub/core/helper_functions/spacing.dart';
import 'package:ecommercefruiteshub/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/custom_widgets/custom_switch.dart';
import '../cubit/cubit/main_profile_cubit.dart';
import '../screens/order_track_screen.dart';
import '../screens/profile_screen.dart';
import 'build_menu_item.dart';
import 'profile_img_picker_bloc_consumer.dart';

class MainProfileScreenBody extends StatefulWidget {
  const MainProfileScreenBody({super.key});

  @override
  State<MainProfileScreenBody> createState() => _MainProfileScreenBodyState();
}

class _MainProfileScreenBodyState extends State<MainProfileScreenBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          highspace(height: 20),
          ProfileImgPickerBlocConsumer(),
          highspace(height: 20),
          Text(getUser().name, style: TextStyles.bold19),
          Text(
            getUser().email,
            style: TextStyles.regular13.copyWith(color: Colors.grey),
          ),
          highspace(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: Text('public'.tr(), style: TextStyles.semiBold13),
          ),
          highspace(height: 15),
          BuildMenuItem(
            leadingWidget: Icon(Icons.person_outline),
            traillingWidget: Icon(Icons.arrow_back_ios_new),
            title: "profile".tr(),
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                withNavBar: false,
                screen: BlocProvider.value(
                  value: context.read<MainProfileCubit>(),
                  child: ProfileScreen(),
                ),
              );
            },
          ),
          BuildMenuItem(
            leadingWidget: Icon(Icons.inventory_2_outlined),
            traillingWidget: Icon(Icons.arrow_back_ios_new),
            title: "orders".tr(),
            onTap: () {
              print("orders");
              PersistentNavBarNavigator.pushNewScreen(
                context,
                withNavBar: false,
                screen: BlocProvider.value(
                  value: context.read<MainProfileCubit>()..getOrderTrack(),
                  child: OrderTrackScreen(),
                ),
              );
            },
          ),
          BuildMenuItem(
            leadingWidget: Icon(Icons.favorite_border),
            traillingWidget: Icon(Icons.arrow_back_ios_new),
            title: "Favourite".tr(),
            onTap: () {},
          ),
          BuildMenuItem(
            leadingWidget: Icon(Icons.notifications_none),
            traillingWidget: CustomSwitch(
              value: true,
              onChanged: (value) {
                print(value);
              },
            ),
            title: "notifications".tr(),
            onTap: () {},
          ),
          BuildMenuItem(
            leadingWidget: Icon(Icons.language),
            traillingWidget: Icon(Icons.arrow_back_ios_new),
            title: "language".tr(),
            onTap: () {
              context.read<MainProfileCubit>().toggelLanguage(context: context);
            },
          ),
          BuildMenuItem(
            leadingWidget: Icon(Icons.dark_mode_outlined),
            traillingWidget: CustomSwitch(value: true, onChanged: (value) {}),
            title: "theme".tr(),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
