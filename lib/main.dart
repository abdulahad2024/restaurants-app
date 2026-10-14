import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurants_app/app/core/app_config/app_config.dart';
import 'app/core/constants/app_size..dart';
import 'app/core/themes/app_theme.dart';
import 'app/routes/app_pages.dart';
Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,

      // ── Theme ──
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,

      // ── Navigation ──
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertino,
      transitionDuration: AppDuration.normal,
    ),
  );
}