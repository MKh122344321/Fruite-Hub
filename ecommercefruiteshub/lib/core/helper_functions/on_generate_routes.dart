import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/sign_in_screen.dart';
import '../../features/auth/presentation/screens/sign_up_screen.dart';
import '../../features/best_selling/presentations/screens/best_selling_screen.dart';
import '../../features/check_out/presentation/screens/check_out_screen.dart';
import '../../features/check_out/presentation/screens/payment_sucess.dart';
import '../../features/home/presentation/screens/home_screeen.dart';
import '../../features/on_boarding/presentation/screens/on_boarding_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/profile/presentation/widgets/main_profile_screen_body.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../man_screen.dart';
import '../entities/order_entity.dart';
import '../utils/routes_names.dart';
import 'get_user.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesNames.splash:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case RoutesNames.onboarding:
      return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
    case RoutesNames.signIn:
      return MaterialPageRoute(builder: (_) => const SignInScreen());
    case RoutesNames.home:
      return MaterialPageRoute(
        builder: (_) {
          // final arguments = settings.arguments as Map<String, dynamic>?;
          // print(arguments?["user"]);
          return HomeScreeen(user: getUser());
        },
      );
    case RoutesNames.signup:
      return MaterialPageRoute(
        builder: (_) {
          return SignUpScreen();
        },
      );
    case RoutesNames.mainScreen:
      return MaterialPageRoute(
        builder: (_) {
          return MainScreen();
        },
      );
    case RoutesNames.bestSelling:
      return MaterialPageRoute(
        builder: (_) {
          return BestSellingScreen();
        },
      );
    case RoutesNames.checkOut:
      return MaterialPageRoute(
        builder: (_) {
          return CheckOutScreen(
            orderInputEntity: settings.arguments as OrderInputEntity,
          );
        },
      );
    case RoutesNames.paymentSuccess:
      return MaterialPageRoute(
        builder: (_) {
          return PaymentSucess(order: settings.arguments as OrderInputEntity);
        },
      );
    case RoutesNames.mainProfileScreen:
      return MaterialPageRoute(
        builder: (_) {
          return MainProfileScreenBody();
        },
      );
    case RoutesNames.profile:
      return MaterialPageRoute(
        builder: (_) {
          return ProfileScreen();
        },
      );

    default:
      return MaterialPageRoute(builder: (_) => MainScreen());
  }
}
