import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommercefruiteshub/man_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/helper_functions/on_generate_routes.dart';
import 'core/secure/constants/constants.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/get_it_service.dart';
import 'core/services/shared_preferences_singleton.dart';
import 'core/utils/constants.dart';
import 'features/cart/presentation/cubit/cubit/cart_entity_cubit.dart';
import 'features/splash/presentation/screens/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Supabase.initialize(url: ksupabaseUrl, anonKey: ksupabaseServiceKey);

  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Prefs.init();
  setupGetit();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Only allow upright portrait
    // DeviceOrientation.portraitDown,
    // DeviceOrientation.landscapeLeft,
    // DeviceOrientation.landscapeRight,
  ]);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => EasyLocalization(
        supportedLocales: [
          Locale('en'), // English
          Locale('ar'), // Arabic
        ],
        fallbackLocale: Locale('ar'), // Choose your default language
        path:
            'assets/translations', // <-- change the path of the translation files

        child: ScreenUtilInit(
          designSize: Size(
            375,
            812,
          ), // Use the design size for your Figma/Sketch design (typically iPhone 11)
          minTextAdapt: true, // Enable text scaling for responsiveness
          builder: (context, child) => child!,
          child: BlocProvider(
            create: (context) => getIt.get<CartEntityCubit>(),
            child: MyApp(),
          ),
        ),
      ), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isLogIn = Prefs.getBool(kIsLoggedIn);
    // late UserEntity user;
    // if (isLogIn) {
    //   user = getUser();
    // }
    return MaterialApp(
      theme: ThemeData(fontFamily: "Cairo"),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: !isLogIn ? SplashScreen() : MainScreen(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
