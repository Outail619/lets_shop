import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lets_shop/core/config/app_routes.dart';
import 'package:lets_shop/core/config/intl/app_localization.dart';
import 'package:lets_shop/core/theme/app_themes.dart';
import 'package:lets_shop/core/utils/constants.dart';
import 'package:lets_shop/views/cart_screen/bloc/cart/cart_bloc.dart';
import 'package:lets_shop/views/home_page/bloc/products/product_bloc.dart';
import 'package:lets_shop/views/settings/bloc/language_cubit.dart';
import 'package:lets_shop/views/splash_screen.dart';
import 'package:lets_shop/views/unknown_route_page.dart';

void mainCommon() {
  runApp(
    // Calling MultiBlocProvider because we'll be using the state of these elements everywhere in our app
    MultiBlocProvider(
      providers: [
        //We start with the LanguageCubit which is important for intl
        BlocProvider(
          create: (_) => LanguageCubit()..loadSavedLanguage(),
        ),
        //Then the ProductBloc with which we load our products, filter and more..
        BlocProvider<ProductBloc>(create: (context) => ProductBloc()),
        //And finally our CartBloc to conclude our purchase
        BlocProvider<CartBloc>(create: (context) => CartBloc())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// We'll be starting by blocking the rotation so it doesn't change, we are not handling landscape mode yet
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    //We start with the BlocBuilder for the LanguageCubit because updating the language is globally in the app
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) => MaterialApp(
        title: "Let's Shop",
        debugShowCheckedModeBanner: false,
        navigatorKey: Constants.globalKey,
        locale: state.locale,
        supportedLocales: AppLocalization.supportedLocales,
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          for (var locale in supportedLocales) {
            if (locale.languageCode == deviceLocale!.languageCode) {
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        },
        localizationsDelegates: const [
          AppLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        theme: AppThemes.light,
        //Setting the routing table
        routes: AppRoutes.routes,
        //Setting our onGenerateRoute function in which it could be customized
        onGenerateRoute: AppRoutes.onGenerateRoute,
        //UnknownRoute in case i push a wrong NamedParameter
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (_) => UnKnownRoutePage(
            title: settings.name,
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
