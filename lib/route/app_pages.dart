import 'package:food_id/route/app_routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../screen/home_binding.dart';
import '../screen/home_screen.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}