import 'package:get/get.dart';
import 'package:task/auth/sigin.dart';
import '../navigationbar/navigationbar.dart';

class Routes {
  static const LOGIN = '/login';
  static const HOME = '/home';
}

final List<GetPage> appPages = [
  GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
  GetPage(name: Routes.HOME, page: () => MainPage()),
];
