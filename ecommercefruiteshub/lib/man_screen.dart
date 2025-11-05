import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:svg_flutter/svg.dart';

import 'core/cubits/products_cubit/products_cubit.dart';
import 'core/helper_functions/build_error_bar.dart';
import 'core/helper_functions/get_user.dart';
import 'core/services/get_it_service.dart';
import 'core/theming/app_text_styles.dart';
import 'features/cart/presentation/cubit/cubit/cart_entity_cubit.dart';
import 'features/cart/presentation/screens/cart_screen.dart';
import 'features/home/domain/entity/pristant_bottom_nav_bar_entity.dart';
import 'features/home/presentation/screens/home_screeen.dart';
import 'features/products/presentation/screens/products_screen.dart';
import 'features/profile/presentation/cubit/cubit/main_profile_cubit.dart';
import 'features/profile/presentation/widgets/main_profile_screen_body.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final PersistentTabController controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> _buildScreens() {
    return [
      HomeScreeen(user: getUser()),
      BlocProvider(
        create: (context) => getIt.get<ProductsCubit>(),
        child: ProductsScreen(),
      ),
      CartScreen(),

      BlocProvider(
        create: (context) => getIt.get<MainProfileCubit>(),
        child: MainProfileScreenBody(),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItemss() =>
      pristantBottomNavBarEntities
          .map(
            (e) => PersistentBottomNavBarItem(
              icon: CircleAvatar(
                backgroundColor: e.activeColorPrimary,
                child: SvgPicture.asset(e.activeIcon),
              ),
              inactiveIcon: SvgPicture.asset(e.inActiveIcon),
              title: e.title.tr(),
              textStyle: TextStyles.semiBold11.copyWith(fontFamily: "Cairo"),

              activeColorPrimary: e.activeColorPrimary,
              inactiveColorPrimary: e.inactiveColorPrimary,
            ),
          )
          .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CartEntityCubit, CartEntityState>(
        listenWhen: (previous, current) => current is AddToCart,
        listener: (context, state) {
          if (state is AddToCart) {
            showBar(context, "product_added_to_cart".tr());
          }
        },
        child: PersistentTabView(
          context,
          controller: controller,
          screens: _buildScreens(),
          items: navBarsItemss(),
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardAppears: true,
          // popBehaviorOnSelectedNavBarItemPress: PopActionScreensType.all,
          padding: const EdgeInsets.only(top: 8),
          backgroundColor: Colors.white,
          isVisible: true,
          animationSettings: const NavBarAnimationSettings(
            navBarItemAnimation: ItemAnimationSettings(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 400),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimationSettings(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              duration: Duration(milliseconds: 200),
              screenTransitionAnimationType:
                  ScreenTransitionAnimationType.fadeIn,
            ),
          ),
          confineToSafeArea: true,
          navBarHeight: kBottomNavigationBarHeight,
          navBarStyle:
              NavBarStyle.style1, // Choose the nav bar style with this property
        ),
      ),
    );
  }
}
