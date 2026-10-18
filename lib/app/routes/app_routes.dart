part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;

  // --- নতুন যোগ করা হলো ---
  static const REGISTER_STEP_TWO = _Paths.REGISTER_STEP_TWO;
  static const REGISTER_STEP_THREE = _Paths.REGISTER_STEP_THREE;

  static const PROFILE = _Paths.PROFILE;
  static const EDIT_PROFILE = _Paths.EDIT_PROFILE;
  static final HOME = _Paths.HOME;
  static const BOTTOM_NAVIGATION = _Paths.BOTTOM_NAVIGATION;
  static const ORDERS = _Paths.ORDERS;
  static const WELCOME = _Paths.WELCOME;
  static const ADD_FOODS = _Paths.ADD_FOODS;
}

abstract class _Paths {
  _Paths._();
  static const LOGIN = '/login';
  static const REGISTER = '/register';

  static const REGISTER_STEP_TWO = '/register-step-two';
  static const REGISTER_STEP_THREE = '/register-step-three';

  static const PROFILE = '/profile';
  static const EDIT_PROFILE = '/edit-profile';
  static const HOME = '/home';
  static const BOTTOM_NAVIGATION = '/bottom-navigation';
  static const ORDERS = '/orders';
  static const WELCOME = '/welcome';
  static const ADD_FOODS = '/add-foods';
}
