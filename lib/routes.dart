//{Map<String, Widget Function(BuildContext)> routes = const <String, WidgetBuilder>{}}
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/app/user/screens/shop/alert_screen.dart';
import 'package:flutter_application_1/app/user/screens/shop/qr_screen.dart';
import 'package:flutter_application_1/app/user/screens/shop/shop_cart_screen.dart';
import 'package:flutter_application_1/app/user/screens/shop/user_screen.dart';
import 'package:flutter_application_1/app/user/screens/login/login_admin/login_admin_screen.dart';
import 'package:flutter_application_1/app/user/screens/login/login_user/login_user_screen.dart';
import 'package:flutter_application_1/app/user/screens/login/login_user/password_screen.dart';
import 'package:flutter_application_1/app/user/screens/login/login_user/sign_up_user_screen.dart';
import 'package:flutter_application_1/app/user/screens/login/select_user_screen.dart';
import 'package:flutter_application_1/app/user/screens/login/splash_screen.dart';
import 'package:flutter_application_1/app/user/screens/shop/principal_main_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "splash": (_) => SplashScreen(),
  "select_user": (_) => SelectScreen(),
  "login": (_) => LoginScreen(),
  "signup": (_) => SignUpUserScreen(),
  "password": (_) => PasswordScreen(),
  "login_admin": (_) => LoginAdminScreen(),
  "principal": (_) => PrincipalMain(),
  "user": (_) => UserScreen(),
  "shop_cart": (_) => ShopCartScreen(),
  "alert": (_) => AlertScreen(),
  "qr": (_) => QrScreen()
};