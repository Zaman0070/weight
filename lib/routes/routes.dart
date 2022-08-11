import 'package:flutter/cupertino.dart';

import '../src/screens/about_screen/about_us_screen.dart';
import '../src/screens/auth_screen/auth_screen.dart';
import '../src/screens/details_screen/details_screen.dart';
import '../src/screens/home_screen/home_screen.dart';
import '../src/screens/splash_screen/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  AuthScreen.routeName: (context) => AuthScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  AboutUs.routeName: (context) => AboutUs(),
};
