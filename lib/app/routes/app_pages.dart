import 'package:get/get.dart';

import '../modules/authentication/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/authentication/edit_profile/views/edit_profile_view.dart';
import '../modules/authentication/login/bindings/login_binding.dart';
import '../modules/authentication/login/views/login_view.dart';
import '../modules/authentication/profile/bindings/profile_binding.dart';
import '../modules/authentication/profile/views/profile_view.dart';
import '../modules/authentication/register/bindings/register_binding.dart';
import '../modules/authentication/register/views/register_step_three_view.dart';
import '../modules/authentication/register/views/register_step_two_view.dart';
import '../modules/authentication/register/views/register_view.dart';
import '../modules/authentication/welcome/bindings/welcome_binding.dart';
import '../modules/authentication/welcome/views/welcome_view.dart';
import '../modules/bottom_nav/bottom_navigation/bindings/bottom_navigation_binding.dart';
import '../modules/bottom_nav/bottom_navigation/views/bottom_navigation_view.dart';
import '../modules/foods/add_foods/bindings/add_foods_binding.dart';
import '../modules/foods/add_foods/views/add_foods_view.dart';
import '../modules/home/home/bindings/home_binding.dart';
import '../modules/home/home/views/home_view.dart';
import '../modules/orders/orders/bindings/orders_binding.dart';
import '../modules/orders/orders/views/orders_view.dart';
import '../modules/spalsh/bindings/spalsh_binding.dart';
import '../modules/spalsh/views/spalsh_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPALSH;

  static final routes = [
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

    // --- রেজিস্টার স্টেপ ২ রাউট যুক্ত করা হলো ---
    GetPage(
      name: _Paths.REGISTER_STEP_TWO,
      page: () => const RegisterStepTwoView(),
      binding: RegisterBinding(),
    ),

    // --- রেজিস্টার স্টেপ ৩ রাউট যুক্ত করা হলো ---
    GetPage(
      name: _Paths.REGISTER_STEP_THREE,
      page: () => const RegisterStepThreeView(),
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
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATION,
      page: () => const BottomNavigationView(),
      binding: BottomNavigationBinding(),
    ),
    GetPage(
      name: _Paths.ORDERS,
      page: () => const OrdersView(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_FOODS,
      page: () => const AddFoodsView(),
      binding: AddFoodsBinding(),
    ),
    GetPage(
      name: _Paths.SPALSH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
