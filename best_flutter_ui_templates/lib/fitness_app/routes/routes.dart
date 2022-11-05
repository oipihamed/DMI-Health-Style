import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
import 'package:get/get.dart';
import '../Login/login_page.dart';
import '../Login/register_login_page.dart';
import '../Login/user_profile_page.dart';
import '../home_page.dart';

routes() => [
      GetPage(name: "/homepage", page: () => HomePage()),
      GetPage(name: "/registerpage", page: () => RegisterLoginPage()),
      GetPage(name: "/loginpage", page: () => LoginPage()),
      GetPage(name: "/menupage", page: () => FitnessAppHomeScreen()),
      GetPage(
          name: "/userprofilepage",
          page: () => UserProfilePage(),
          transition: Transition.zoom),
    ];
