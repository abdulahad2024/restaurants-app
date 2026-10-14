import 'package:get/get.dart';

import '../modules/authentication/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/authentication/edit_profile/views/edit_profile_view.dart';
import '../modules/authentication/login/bindings/login_binding.dart';
import '../modules/authentication/login/views/login_view.dart';
import '../modules/authentication/profile/bindings/profile_binding.dart';
import '../modules/authentication/profile/views/profile_view.dart';
import '../modules/authentication/register/bindings/register_binding.dart';
import '../modules/authentication/register/views/register_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
  ];
}
