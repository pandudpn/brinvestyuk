import 'package:flutter/material.dart';
import 'package:learn_brinvestyuk/app_config.dart';
import 'package:learn_brinvestyuk/helpers/store_management.dart';
import 'package:learn_brinvestyuk/screens/auth/login/login_screen.dart';
import 'package:learn_brinvestyuk/screens/auth/register/register.dart';
import 'package:learn_brinvestyuk/screens/explore/explore_screen.dart';
import 'package:learn_brinvestyuk/screens/mainpage/main_page.dart';
import 'package:learn_brinvestyuk/screens/onboard/onboarding_screen.dart';
import 'package:learn_brinvestyuk/view_model/articles/articles_list_view_model.dart';
import 'package:learn_brinvestyuk/view_model/auth/login/login_list_view_model.dart';
import 'package:learn_brinvestyuk/view_model/products/products_list_view_model.dart';
import 'package:learn_brinvestyuk/view_model/users/user_profile_list_view_model.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final StorageManagement storage = StorageManagement();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginListViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProfileListViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductsListViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ArticlesListViewModel(),
        ),
      ],
      child: MaterialApp(
        title: AppConfig.of(context)!.appTitle,
        theme: ThemeData(
          fontFamily: "Roboto",
          primaryColor: Color(0xff43568e),
          accentColor: Color(0xffef6a00),
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Color(0xff43568e),
              letterSpacing: 1,
              decoration: TextDecoration.none,
            ),
            headline2: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xff43568e),
              decoration: TextDecoration.none,
            ),
            headline3: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff43568e),
              decoration: TextDecoration.none,
            ),
            headline4: TextStyle(
              fontSize: 17.5,
              fontWeight: FontWeight.bold,
              color: Color(0xff43568e),
              decoration: TextDecoration.none,
            ),
            headline5: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff43568e),
              decoration: TextDecoration.none,
            ),
            bodyText1: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff43568e),
            ),
            bodyText2: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff43568e),
            ),
            subtitle1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff43568e),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: storage.firstInstall
            ? OnboardingScreen()
            : storage.token != null
                ? MainPage()
                : ExploreScreen(),
      ),
    );
  }
}
