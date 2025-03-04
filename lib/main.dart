import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/cache_helper/cache_helper.dart';
import 'package:evently_app/firebase_functions.dart';
import 'package:evently_app/provider/my_provider.dart';
import 'package:evently_app/screens/create_event_screen.dart';
import 'package:evently_app/screens/forget_pass_screen.dart';
import 'package:evently_app/screens/home_screen.dart';
import 'package:evently_app/screens/introduction_screen.dart';
import 'package:evently_app/screens/login_screen.dart';
import 'package:evently_app/screens/on_boarding_screen.dart';
import 'package:evently_app/screens/register_screen.dart';
import 'package:evently_app/theme/base_theme.dart';
import 'package:evently_app/theme/dark_theme.dart';
import 'package:evently_app/theme/light_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  runApp(EasyLocalization(
    supportedLocales: [
      Locale("en"),
      Locale("ar"),
    ],
    path: "assets/translations",
    fallbackLocale: Locale("en"),
    child: ChangeNotifierProvider(
        create: (context) => MyProvider(), child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    BaseTheme lightTheme = LightTheme();
    BaseTheme darkTheme = DarkTheme();
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: lightTheme.themeData,
      darkTheme: darkTheme.themeData,
      themeMode: provider.themeMode,
      initialRoute: CacheHelper.getOnBoarding() == true
          ? LoginScreen.routeName
          : IntoScreen.routeName,
      routes: {
        IntoScreen.routeName: (context) => IntoScreen(),
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        ForgetPassScreen.routeName: (context) => ForgetPassScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        CreateEventScreen.routeName: (context) => CreateEventScreen(),
      },
    );
  }
}
